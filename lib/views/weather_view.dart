import 'package:intl/intl.dart';
import 'package:weather_prediction/exports.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchWeather());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather Prediction',
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ubmbrellaImageIcon),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherStateLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (state is WeatherStateLoaded) {
                final weatherList = state.weatherResponse.weatherList
                    .toList();

                if (weatherList.isEmpty) {
                  return Center(
                      child: Text(
                    'No weather data available.',
                    style: AppStyles.bold20,
                  ));
                }

                final currentWeather = weatherList.first;
                final forecastWeather = weatherList.skip(1).toList();

                final groupedWeather = _groupWeatherByDay(forecastWeather);

                return Column(
                  children: [
                    _buildCurrentWeather(currentWeather),
                    const SizedBox(height: 16.0),
                    _buildDayForecastList(groupedWeather),
                  ],
                );
              } else if (state is WeatherStateError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const Center(child: Text('No data'));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentWeather(Weather weather) {
    if (weather == null || weather.weather.isEmpty) {
      return Center(
          child: Text(
        'Weather data is not available.',
        style: AppStyles.bold20,
      ));
    }

    final weatherDetail = weather.weather.first;
    final temperatureCelsius =
        weather.main.temp - 273.15;
    final minTemperatureCelsius =
        weather.main.tempMin - 273.15;
    final maxTemperatureCelsius =
        weather.main.tempMax - 273.15;
    final rainAmount = weather.rain?.h3 ?? 0.0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Weather',
              style: AppStyles.bold20,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.cloudImageIcon,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weatherDetail.description,
                        style: AppStyles.regular18,
                      ),
                      Text(
                        'Temperature: ${temperatureCelsius.toStringAsFixed(1)} °C',
                        style: AppStyles.regular18,
                      ),
                      Text(
                        'Min: ${minTemperatureCelsius.toStringAsFixed(1)} °C',
                        style: AppStyles.regular18,
                      ),
                      Text(
                        'Max: ${maxTemperatureCelsius.toStringAsFixed(1)} °C',
                        style: AppStyles.regular18,
                      ),
                      if (rainAmount > 0)
                        Text(
                          'Rain (3h): ${rainAmount.toStringAsFixed(2)} mm',
                          style: AppStyles.regular18,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayForecastList(Map<String, List<Weather>> groupedWeather) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: groupedWeather.keys.length,
          itemBuilder: (context, index) {
            final dayKey = groupedWeather.keys.elementAt(index);
            final dailyWeather = groupedWeather[dayKey]!;

            return Container(
              width: 200.0,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(dayKey, style: AppStyles.regular18),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dailyWeather.length,
                      itemBuilder: (context, timeIndex) {
                        final item = dailyWeather[timeIndex];
                        final weatherDescription = item.weather.isNotEmpty
                            ? item.weather.first.description
                            : 'No description';
                        final weatherIcon = item.weather.isNotEmpty
                            ? item.weather.first.icon
                            : '01d';

                        final temperatureCelsius = item.main.temp - 273.15;
                        final rainAmount = item.rain?.h3 ?? 0.0;

                        final dateTime = DateTime.parse(item.dtTxt);
                        final timeString = DateFormat('h:mm a')
                            .format(dateTime); // AM/PM formatting

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WeatherDetailsPage(weather: item),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.grey.shade800,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    'http://openweathermap.org/img/wn/$weatherIcon.png',
                                    width: 40,
                                    height: 40,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(timeString,
                                          style: AppStyles.regular12),
                                      Text(weatherDescription,
                                          style: AppStyles.regular12),
                                      Text(
                                          '${temperatureCelsius.toStringAsFixed(1)} °C',
                                          style: AppStyles.regular12),
                                      Text(
                                          'Rain: ${rainAmount.toStringAsFixed(2)} mm',
                                          style: AppStyles.regular12),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Map<String, List<Weather>> _groupWeatherByDay(List<Weather> weatherList) {
    final Map<String, List<Weather>> groupedWeather = {};

    for (var weather in weatherList) {
      final dateTime = DateTime.parse(weather.dtTxt);
      final dayKey = DateFormat('EEEE').format(dateTime);

      if (groupedWeather[dayKey] == null) {
        groupedWeather[dayKey] = [];
      }

      groupedWeather[dayKey]!.add(weather);
    }

    return groupedWeather;
  }
}
