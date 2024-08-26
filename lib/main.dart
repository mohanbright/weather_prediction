import 'exports.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;

  await requestLocationPermission();

  final dio = Dio();
  final weatherService = WeatherService(dio);
  final weatherBloc = WeatherBloc(weatherService);

  runApp(MyApp(weatherBloc: weatherBloc));
}

Future<void> requestLocationPermission() async {
  var status = await Permission.location.status;
  if (!status.isGranted) {
    await Permission.location.request();
  }
}

class MyApp extends StatelessWidget {
  final WeatherBloc weatherBloc;

  MyApp({required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: AppStyles.bold20,
        ),
      ),
      home: SplashScreen(weatherBloc: weatherBloc),
    );
  }
}
