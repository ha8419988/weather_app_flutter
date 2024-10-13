import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/apps/utils/asset.dart';
import 'package:weather/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> getApiWeather(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position!.latitude}&lon=${position.latitude}&units=metric&appid=${MyKey.apiKey}');
      final data = res.data;
      WeatherData weatherData = WeatherData.fromMap(data);
      return weatherData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> getApiWeatherDetail(
      Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position!.latitude}&lon=${position.latitude}&units=metric&appid=${MyKey.apiKey}');

      final data = res.data['list'];
      // List<WeatherDetail> result =
      //     data.map((e) => WeatherDetail.fromMap(e)).toList();
      List<WeatherDetail> result = List<WeatherDetail>.from(
          data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result;
    } catch (e) {
      print('e $e');
      rethrow;
    }
  }
}
