import 'package:weather_prediction/exports.dart';

class WeatherDetailsPage extends StatelessWidget {
  final Weather weather;

  const WeatherDetailsPage({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    final weatherDescription = weather.weather.isNotEmpty
        ? weather.weather.first.description
        : 'No description';
    final weatherIcon =
        weather.weather.isNotEmpty ? weather.weather.first.icon : '01d';
    final temperatureCelsius = weather.main.temp - 273.15;
    final rainAmount = weather.rain?.h3 ?? 0.0;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Details',
            style: AppStyles.regular18,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ubmbrellaImageIcon),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'http://openweathermap.org/img/wn/$weatherIcon.png',
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4.0,
                  color: Colors.grey.shade700,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Date',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      weather.dtTxt,
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Description',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      weatherDescription,
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Temperature',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${temperatureCelsius.toStringAsFixed(1)} °C',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Feels Like',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${(weather.main.feelsLike - 273.15).toStringAsFixed(1)} °C',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Humidity',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.main.humidity}%',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Pressure',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.main.pressure} hPa',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Rain (3h)',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${rainAmount.toStringAsFixed(2)} mm',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Wind Speed',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.wind.speed} m/s',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Wind Gust',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.wind.gust?.toStringAsFixed(2) ?? 'N/A'} m/s',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Visibility',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.visibility / 1000} km',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Cloudiness',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.clouds.all}%',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey.shade700,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      'Probability of Precipitation',
                      style: AppStyles.regular18, 
                    ),
                    subtitle: Text(
                      '${weather.pop * 100}%',
                      style: AppStyles.regular18, 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
