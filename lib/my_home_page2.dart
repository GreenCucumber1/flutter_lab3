import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<WeatherHTTP> fetchFanFromServer(String url) async{
  final response = await http.get(Uri.parse(url));
  return WeatherHTTP.fromJson(jsonDecode(response.body));
}

class WeatherHTTP {

  final String snow ;

  

const WeatherHTTP({
  required this.snow,
  });
  
  factory WeatherHTTP.fromJson(Map<String,dynamic> json) {
    return WeatherHTTP(
      snow: json['snow'],
    

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
  late Future<WeatherHTTP> futureFanFromServer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<WeatherHTTP>(
            future: fetchFanFromServer(widget.url),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
               /*return Column(
                  children: <Widget>[
                    Text(snapshot.data!.city_name),
                    Text(snapshot.data!.country_code),
                    
                  ],
                );
                */
                return Text(snapshot.data!.snow);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
