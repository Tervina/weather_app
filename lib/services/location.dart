import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class GetCurrentLocation{
  double latitude=0;
  double logitude=0;
 // GetCurrentLocation({required this.latitude,required this.logitude});
  Future<void> getLocation()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude=position.latitude;
    logitude=position.longitude;
    print("get location in location done");

  }
}
