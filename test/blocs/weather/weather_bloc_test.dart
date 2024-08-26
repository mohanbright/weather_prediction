import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:weather_prediction/blocs/weather/weather_bloc.dart';
import 'package:weather_prediction/services/weather_service.dart';
import 'package:weather_prediction/models/weather_model.dart';
import 'package:mockito/mockito.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  group('WeatherBloc', () {
    late WeatherBloc weatherBloc;
    late MockWeatherService mockWeatherService;

    setUp(() {
      mockWeatherService = MockWeatherService();
      weatherBloc = WeatherBloc(mockWeatherService);
    });

    test('initial state is WeatherStateInitial', () {
      expect(weatherBloc.state, WeatherStateInitial());
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherStateLoading, WeatherStateLoaded] when FetchWeather is added',
      build: () {
        final weatherResponse = WeatherResponse((b) => b
          ..weatherList.replace([
            Weather((b) => b
              ..main = Main((b) => b..temp = 305.65).toBuilder()
              ..weather.replace([
                WeatherDescription((b) => b
                  ..description = 'light rain'
                  ..icon = '10d').toBuilder()
              ])).toBuilder()
          ]));

        when(mockWeatherService.getWeather(0, 0))
            .thenAnswer((_) async => weatherResponse);

        return weatherBloc;
      },
      act: (bloc) => bloc.add(FetchWeather()),
      expect: () => [
        WeatherStateLoading(),
        WeatherStateLoaded(WeatherResponse((b) => b
          ..weatherList.replace([
            Weather((b) => b
              ..main = Main((b) => b..temp = 305.65)
                  .toBuilder() // Convert to builder
              ..weather.replace([
                WeatherDescription((b) => b
                  ..description = 'light rain'
                  ..icon = '10d').toBuilder()
              ])).toBuilder()
          ]))),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherStateLoading, WeatherStateError] when FetchWeather fails',
      build: () {
        when(mockWeatherService.getWeather(0, 0))
            .thenThrow(Exception('Failed to fetch weather'));

        return weatherBloc;
      },
      act: (bloc) => bloc.add(FetchWeather()),
      expect: () => [import 'package:flutter_test/flutter_test.dart';
    import 'package:bloc_test/bloc_test.dart';
    import 'package:weather_prediction/blocs/weather/weather_bloc.dart';
    import 'package:weather_prediction/services/weather_service.dart';
    import 'package:weather_prediction/models/weather_model.dart';
    import 'package:mockito/mockito.dart';
    import 'package:mockito/annotations.dart';

// Generate a Mock class using Mockito
    @GenerateMocks([WeatherService])
    void main() {
      late WeatherBloc weatherBloc;
      late MockWeatherService mockWeatherService;

      setUp(() {
        mockWeatherService = MockWeatherService();
        weatherBloc = WeatherBloc(mockWeatherService);
      });

      test('initial state is WeatherStateInitial', () {
        expect(weatherBloc.state, isA<WeatherStateInitial>());
      });

      blocTest<WeatherBloc, WeatherState>(
        'emits [WeatherStateLoading, WeatherStateLoaded] when FetchWeather is added',
        build: () {
          final weatherResponse = WeatherResponse((b) => b
            ..weatherList.replace([
              Weather((b) => b
                ..main = Main((b) => b..temp = 305.65).toBuilder()
                ..weather.replace([
                  WeatherDescription((b) => b
                    ..description = 'light rain'
                    ..icon = '10d').toBuilder()
                ])).toBuilder()
            ]));

          // Mocking the service to return the weatherResponse
          when(mockWeatherService.getWeather(0, 0))
              .thenAnswer((_) async => weatherResponse);

          return weatherBloc;
        },
        act: (bloc) => bloc.add(FetchWeather()),
        expect: () {
          // Use a fixed DateTime for predictability in tests
          final lastFetched = DateTime(2024, 1, 1, 12, 0);
          return [
            WeatherStateLoading(),
            WeatherStateLoaded(weatherResponse, lastFetched),
          ];
        },
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits [WeatherStateLoading, WeatherStateError] when FetchWeather fails',
        build: () {
          when(mockWeatherService.getWeather(0, 0))
              .thenThrow(Exception('Failed to fetch weather'));

          return weatherBloc;
        },
        act: (bloc) => bloc.add(FetchWeather()),
        expect: () => [
          WeatherStateLoading(),
          WeatherStateError('Failed to fetch weather'),
        ],
      );
    }

    WeatherStateLoading(),
        WeatherStateError('Failed to fetch weather'),
      ],
    );
  });
}
