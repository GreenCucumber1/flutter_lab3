import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:teplov_lab2/provider.dart';





class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.url,required this.url1,}) : super(key: key);

  final String url;
  final String url1; 

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InputProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(url + url1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.qwer != null)
              
                Text("City name: " + provider.qwer!.city_name.toString()+"\nState code: " + provider.qwer!.state_code.toString()+"\nCountry code: " 
                + provider.qwer!.country_code.toString()+"\nLat: " + provider.qwer!.lat.toString()+"\nLon: " + provider.qwer!.lon.toString()+"\nTimezone: " + provider.qwer!.timezone.toString()
                ,style: TextStyle(fontSize: 17.0),)
               
                
                
              else
                const Text("error")
            ],
          )),
        ),
      ),
    );
  }
}









