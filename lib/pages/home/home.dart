import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/pages/home/widgets/home_detail_weather.dart';
import 'package:weather/pages/home/widgets/home_location.dart';
import 'package:weather/pages/home/widgets/home_temperature.dart';
import 'package:weather/pages/home/widgets/home_weather_icon.dart';
import 'package:weather/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getApiWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff1D6CF3),
            Color(0xff19D2FE),
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        )),
        child: FutureBuilder(
            future: context.read<WeatherProvider>().getApiWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('No data'),
                );
              }
              WeatherData weatherData = snapshot.data as WeatherData;
              final nameIcon = weatherData.weather[0].main;
              final temp = weatherData.main.temp;
              final location = weatherData.name;
              final humidity = weatherData.main.humidity;
              final speedWind = weatherData.wind.speed;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeWeatherIcon(
                    nameIcon: nameIcon,
                  ),
                  HomeTemperature(
                    temp: temp,
                  ),
                  HomeLocation(
                    location: location,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  HomeDetailWeather(
                    humidity: humidity,
                    speedWind: speedWind,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
