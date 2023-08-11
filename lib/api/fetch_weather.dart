import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import '../model/weather_data_current.dart';
import 'api_key.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  Future<WeatherData> processData(latitude, longitude) async {
    var response = await http.get(Uri.parse(apiURL(latitude, longitude)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString));

    return weatherData!;
  }

  String apiURL(var latitude, var longitude) {
    String url;

    url =
        "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$latitude, $longitude&days=3&aqi=no&alerts=no";
    return url;
  }
}
