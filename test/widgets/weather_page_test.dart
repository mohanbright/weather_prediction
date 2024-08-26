import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_prediction/blocs/weather/weather_bloc.dart';
import 'package:weather_prediction/models/weather_model.dart';
import 'package:weather_prediction/views/weather_view.dart';
import 'package:mockito/mockito.dart';

// Mock WeatherBloc
class MockWeatherBloc extends Mock implements WeatherBloc {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;

  testWidgets('WeatherPage displays weather data', (WidgetTester tester) async {
    final mockWeatherBloc = MockWeatherBloc();

    // Create a WeatherResponse object with dummy data
    final weatherResponse = WeatherResponse((b) => b
      ..weatherList.add(Weather((b) => b
        ..main = Main((b) => b..temp = 305.65).toBuilder()
        ..weather.add(WeatherDescription((b) => b
          ..description = 'light rain'
          ..icon = '10d')
        )
      ))
    );

    // Mock the WeatherBloc state
    when(mockWeatherBloc.state).thenReturn(WeatherStateLoaded(weatherResponse));

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherBloc>.value(
          value: mockWeatherBloc,
          child: const WeatherPage(),
        ),
      ),
    );

    // Verify that the WeatherPage displays the expected data
    expect(find.text('Weather Forecast'), findsOneWidget);
    expect(find.text('Temperature: 32.5 °C'), findsOneWidget); // 305.65K = 32.5°C
    expect(find.byType(ListTile), findsOneWidget);

    // Optional: Verify the ListTile contains the correct description
    expect(find.text('light rain'), findsOneWidget);
  });
}
