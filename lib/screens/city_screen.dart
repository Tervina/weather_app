import 'package:flutter/material.dart';
import 'package:weather_app/consts.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/Network.dart';
import 'package:weather_app/services/weather.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  String city_Name = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 50,
                    )),
              ),
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      city_Name = value;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 30,
                        ),
                        hintText: "Enter Your City",
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ))),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    setState(() async {
                      Weathear weather = Weathear();
                      dynamic updatedWeatherCity =
                          await weather.getCityWeather(city_Name);
                      //Navigator.pop(context, city_Name);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LocationScreen(weatherData: updatedWeatherCity);
                      }));
                    });
                  },
                  child: Text(
                    "Get Weather",
                    style: kTextStyle,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
