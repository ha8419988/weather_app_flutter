import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/repository/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;
  String nameCity = 'Ha Noi';
  void updatePostion(Position currentPosition) {
    position = currentPosition;
    notifyListeners();
  }

  Future<WeatherData> getApiWeather() async {
    final data = await ApiRepository.getApiWeather(position);
    nameCity = data.name;
    return data;
  }

  Future<List<WeatherDetail>> getApiWeatherDetail() async {
    final data = await ApiRepository.getApiWeatherDetail(position);
    return data;
  }
}
