import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/Network.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/screens/city_screen.dart';

const openWeatherApp = "https://api.openweathermap.org/data/2.5/weather";

class Weathear {
  dynamic weatherData;

  Future<dynamic> getCityWeather(String cityName) async {
    GetCurrentLocation getCurrentLocation = GetCurrentLocation();
    await getCurrentLocation.getLocation();
    String url = '$openWeatherApp/?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherLocation() async {
    GetCurrentLocation getCurrentLocation = GetCurrentLocation();
    await getCurrentLocation.getLocation();
    String url =
        '$openWeatherApp?lat=${getCurrentLocation
        .latitude}&lon=${getCurrentLocation
        .logitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    weatherData = networkHelper.getData();
    print("get weather location done in weather screen");
    print(weatherData);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
