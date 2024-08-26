import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:weather_prediction/models/weather_model.dart';
import 'package:weather_prediction/services/weather_service.dart';

// Mock Dio
class MockDio extends Mock implements Dio {}

void main() {
  late WeatherService weatherService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    weatherService = WeatherService(mockDio);
  });

  test('getWeather returns WeatherResponse on success', () async {
    final responseJson = {
      "list": [
        {
          "main": {
            "temp": 305.65,
          },
          "weather": [
            {
              "description": "light rain",
              "icon": "10d",
            },
          ],
        }
      ]
    };

    // Create a mock Response object
    final mockResponse = Response(
      requestOptions: RequestOptions(path: ''),  // You need to provide a non-null RequestOptions
      data: responseJson,
      statusCode: 200,
    );

    when(mockDio.get(
      '0',
      queryParameters: anyNamed('queryParameters'),
    )).thenAnswer((_) async => mockResponse);

    final result = await weatherService.getWeather(30.7046, 76.7179);
    expect(result, isA<WeatherResponse>());
    expect(result.weatherList.first.main.temp, 305.65);
    expect(result.weatherList.first.weather.first.description, 'light rain');
  });

  test('getWeather throws exception on failure', () async {
    when(mockDio.get(
      '0',
      queryParameters: anyNamed('queryParameters'),
    )).thenThrow(Exception('Failed to fetch weather'));

    expect(
          () async => await weatherService.getWeather(30.7046, 76.7179),
      throwsA(isA<Exception>()),
    );
  });
}
