import 'package:dio/dio.dart';
import 'package:weather_prediction/exports.dart';

class WeatherService {
  final Dio _dio;

  WeatherService(this._dio);

  Future<WeatherResponse> getWeather(double lat, double lon) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': '37ea9939152496e5de6ca532f93817fd',
        },
      );
      print('Response Api :- ${response.data}');
      return WeatherResponse.fromJson(response.data);
    } catch (e) {
      print('Error fetching weather data: $e');
      rethrow;
    }
  }
}
