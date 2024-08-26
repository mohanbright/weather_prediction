import 'package:weather_prediction/exports.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  final WeatherService _weatherService;
  final Duration cacheDuration =
      const Duration(minutes: 30);

  WeatherBloc(this._weatherService) : super(WeatherState.initial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherState.loading());

    final currentTime = DateTime.now();

    try {
      if (state is WeatherStateLoaded) {
        final lastFetched = (state as WeatherStateLoaded).lastFetched;
        if (lastFetched != null &&
            currentTime.difference(lastFetched) < cacheDuration) {
          emit(WeatherState.loaded(
              (state as WeatherStateLoaded).weatherResponse, lastFetched));
          return;
        }
      }

      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      print(
          'Latitude :- ${position.latitude} Longitude :- ${position.longitude}');
      final weatherResponse = await _weatherService.getWeather(
          position.latitude, position.longitude);

      emit(WeatherState.loaded(weatherResponse, currentTime));
    } catch (e) {
      if (state is WeatherStateLoaded) {
        emit(WeatherState.loaded((state as WeatherStateLoaded).weatherResponse,
            (state as WeatherStateLoaded).lastFetched));
      } else {
        emit(WeatherState.error('No cached data available.'));
      }
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    try {
      final weatherResponse = WeatherResponse.fromJson(json['weatherResponse']);
      final lastFetched = DateTime.parse(json['lastFetched']);
      return WeatherState.loaded(weatherResponse, lastFetched);
    } catch (_) {
      return WeatherState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if (state is WeatherStateLoaded) {
      return {
        'weatherResponse': state.weatherResponse.toJson(),
        'lastFetched': state.lastFetched.toIso8601String(),
      };
    }
    return null;
  }
}
