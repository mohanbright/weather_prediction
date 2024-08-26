part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();
  factory WeatherState.initial() = WeatherStateInitial;
  factory WeatherState.loading() = WeatherStateLoading;
  factory WeatherState.loaded(WeatherResponse weatherResponse, DateTime lastFetched) = WeatherStateLoaded;
  factory WeatherState.error(String message) = WeatherStateError;
}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  final WeatherResponse weatherResponse;
  final DateTime lastFetched;

  WeatherStateLoaded(this.weatherResponse, this.lastFetched);
}

class WeatherStateError extends WeatherState {
  final String message;

  WeatherStateError(this.message);
}
