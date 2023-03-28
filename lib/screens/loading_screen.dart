import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/Network.dart';
import 'package:weather_app/services/weather.dart';

const apiKey = "39770224035f210673c5f92ecbc80acc";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getDataLocation();
  }

  @override
  void getDataLocation() async {
    GetCurrentLocation getCurrentLocation = GetCurrentLocation();
    await getCurrentLocation.getLocation();
    // NetworkHelper networkHelper=NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${getCurrentLocation.latitude}&lon=${getCurrentLocation.logitude}&appid=$apiKey&units=metric');
    //networkHelper.getData();
    Weathear weathear = Weathear();
    dynamic weathearData = await weathear.getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weathearData,
      );
    }));
    print("get data function in loading screen done");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 50,
              duration: Duration(milliseconds: 700),
            ),
          )
        ],
      ),
    );
  }
}
