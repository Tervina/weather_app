import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart';
const apiKey="39770224035f210673c5f92ecbc80acc";
class NetworkHelper{
  String url;
  NetworkHelper({required this.url});
 getData()async{
  Response response=await get(Uri.parse(url));
  String data=response.body;
  print("get data in network screen done");
  return jsonDecode(data);

}

}