import 'package:flutter_test/flutter_test.dart';
import 'package:weather_prediction/models/weather_model.dart';

void main() {
  test('WeatherResponse serialization and deserialization', () {
    final weatherResponse = WeatherResponse((b) => b
      ..weatherList.add(Weather((b) => b
        ..main.update((b) => b..temp = 305.65)
        ..weather.add(WeatherDescription((b) => b
          ..description = 'light rain'
          ..icon = '10d'
        ))
      ))
    );

    final serialized = weatherResponse.toJson();
    final deserialized = WeatherResponse.fromJson(serialized);

    expect(deserialized.weatherList.first.main.temp, 305.65);
    expect(deserialized.weatherList.first.weather.first.description, 'light rain');
  });

  test('Weather model serialization and deserialization', () {
    final weather = Weather((b) => b
      ..main.update((b) => b..temp = 305.65)
      ..weather.add(WeatherDescription((b) => b
        ..description = 'light rain'
        ..icon = '10d'
      ))
    );

    final serialized = weather.toJson();
    final deserialized = Weather.fromJson(serialized);

    expect(deserialized.main.temp, 305.65);
    expect(deserialized.weather.first.description, 'light rain');
  });

  test('WeatherDescription model serialization and deserialization', () {
    final weatherDescription = WeatherDescription((b) => b
      ..description = 'light rain'
      ..icon = '10d'
    );

    final serialized = weatherDescription.toJson();
    final deserialized = WeatherDescription.fromJson(serialized);

    expect(deserialized.description, 'light rain');
    expect(deserialized.icon, '10d');
  });

  test('Main model serialization and deserialization', () {
    final main = Main((b) => b..temp = 305.65);

    final serialized = main.toJson();
    final deserialized = Main.fromJson(serialized);

    expect(deserialized.temp, 305.65);
  });
}
