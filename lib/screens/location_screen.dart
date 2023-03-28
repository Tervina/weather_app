import 'package:flutter/material.dart';
import 'package:weather_app/consts.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.weatherData});

  dynamic weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  int temperature = 0;

//int condition=0;
  String weatherIcon = "";
  String message = "";
  String cityName = "";

  //Weathear weatherData=Weathear();
  //dynamic data =weatherData.getWeatherLocation();
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state");
    print(widget.weatherData);
    print(widget.weatherData['name']);
    //print(cityName);
    updateUi(widget.weatherData);
  }

  Future<dynamic> getDataWeather() async {
    Weathear weathear = Weathear();
    return weathear.getWeatherLocation();
  }

  updateUi(dynamic data) async {
    //dynamic data
    Weathear weathear = Weathear();
    //dynamic data=await weathear.getWeatherLocation();
    setState(() {
      if (data == null) {
        temperature = 0;
        weatherIcon = "Error";
        message = "unable to get weather data";
        cityName = "";
      } else {
        double temp = data['main']['temp'];
        temperature = temp.toInt();
        print(temperature);
        cityName = data['name'];
        print(cityName);
        var condition = data['weather'][0]['id'];
        print(condition);
        message = weathear.getMessage(temperature);
        print(message);
        weatherIcon = weathear.getWeatherIcon(condition);
        print("updated ui done");
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }));
                      },
                      icon: Icon(
                        Icons.location_city,
                        size: 50,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "$temperature°",
                    style: kTextStyle,
                  ),
                  Text(
                    "$weatherIcon",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "$message is $cityName",
                style: kTextStyle,
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ),
    );
  }
}
