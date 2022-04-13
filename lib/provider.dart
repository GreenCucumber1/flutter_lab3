import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class CatHttp {
  final int statusCode;

  CatHttp({required this.statusCode});

  factory CatHttp.fromResponse(http.Response response) {
    return CatHttp(statusCode: response.statusCode);
  }
}





class WeatherHTTP {
 // final int statusCode;
 final String city_name ;
 final String state_code ;
  final String country_code ;
  final String timezone ;
  final double lat ;
  final double lon ;
  
  WeatherHTTP({required this.city_name,required this.state_code,
  required this.country_code,
  required this.timezone,
 
  required this.lat,
  required this.lon,});

   factory WeatherHTTP.fromJson(Map<String,dynamic> json) {
    return WeatherHTTP(
      city_name: json['city_name'],
      state_code: json['state_code'],
      country_code: json['country_code'],
      timezone: json['timezone'],
      
      lat: json['lat'],
      lon: json['lon'],
    );
    
  }
}

class InputProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WeatherHTTP? _qwer;
  WeatherHTTP? get qwer => _qwer;

  Future<void> fetchStatusCode(String x,String y) async {
    _isLoading = true;
    notifyListeners();
    String qwer="https://api.weatherbit.io/v2.0/forecast/daily?lat=${x}&lon=${y}&key=5e2805de11cd4b7baad01f51ed9c7a23&include=minutely";
    final response = await http.get(Uri.parse(qwer));
    _qwer = WeatherHTTP.fromJson(jsonDecode(response.body));
    _isLoading = false;
    notifyListeners();
  }
}
