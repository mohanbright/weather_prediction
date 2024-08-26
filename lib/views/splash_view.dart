import 'package:weather_prediction/exports.dart';

class SplashScreen extends StatefulWidget {
  final WeatherBloc weatherBloc;

  const SplashScreen({super.key, required this.weatherBloc});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToWeatherPage() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: widget.weatherBloc,
          child: const WeatherPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ubmbrellaImageIcon),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.cloudImageIcon),
                const SizedBox(height: 20),
                Text(
                  AppStrings.strAppName,
                  style: AppStyles.regular24,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CustomButton(
                      buttonText: 'Get Started', onTap: _navigateToWeatherPage),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
