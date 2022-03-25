import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<WeatherHTTP> fetchFanFromServer(String x,String y) async{
  String qwer="https://api.weatherbit.io/v2.0/forecast/daily?lat=${x}&lon=${y}&key=5e2805de11cd4b7baad01f51ed9c7a23&include=minutely";
  final response = await http.get(Uri.parse(qwer));
  //final response = await http.get(Uri.parse(
   //"https://api.weatherbit.io/v2.0/forecast/daily?lat=35.7796&lon=-78.6382&key=5e2805de11cd4b7baad01f51ed9c7a23&include=minutely"));
  //print(jsonDecode(response.body));
  return WeatherHTTP.fromJson(jsonDecode(response.body));
}

class WeatherHTTP {

  final String city_name ;
  final String state_code ;
  final String country_code ;
  final String timezone ;
  final double lat ;
  final double lon ;
  final List<dynamic> data;

  

const WeatherHTTP({ 
  required this.city_name,
  required this.state_code,
  required this.country_code,
  required this.timezone,
  required this.data,
  required this.lat,
  required this.lon,
  });
  
  factory WeatherHTTP.fromJson(Map<String,dynamic> json) {
    return WeatherHTTP(
      city_name: json['city_name'],
      state_code: json['state_code'],
      country_code: json['country_code'],
      timezone: json['timezone'],
      data: json['data'],
      lat: json['lat'],
      lon: json['lon'],
      
    );
    
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({
    required this.url,
    Key? key,}) : super(key: key);

    final String url;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  late Future<WeatherHTTP> futureFanFromServer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text('Back'),
      ),
        body: Center(
          child: FutureBuilder<WeatherHTTP>(
            future: fetchFanFromServer(widget.url,widget.url),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
               return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Text("City name: " + snapshot.data!.city_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text("State code: " + snapshot.data!.state_code,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text("Country code: " + snapshot.data!.country_code,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text("Lat: " + snapshot.data!.lat.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text("Lon: " + snapshot.data!.lon.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text("Timezone: " + snapshot.data!.timezone,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text("And other data:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),),
                    Text(snapshot.data!.data[2].toString(),textAlign: TextAlign.center),
                    
                    
                  ],  
                );

                    
                
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      
    );
  }
}
