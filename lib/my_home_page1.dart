import 'package:provider/provider.dart';
import 'package:teplov_lab2/provider.dart';

import 'my_home_page2.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeatherBit API"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          width: 500,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 20),),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Print lat and lon',
                    style: TextStyle(fontSize: 25, color: Colors.black)),
              ),
           
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(                      
                  width: 50,
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Lan',                      
                    ),
                  ),
                ),
              ),

                Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(                      
                  width: 50,
                  child: TextFormField(
                    controller: _controller1,
                      decoration: const InputDecoration(labelText: 'Lon',                      
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty && _controller1.text.isEmpty) {
                    print("error");
                  } else {
                    String url = _controller.text;
                    String url1 = _controller1.text;
                    context.read<InputProvider>().fetchStatusCode(url,url1);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(url: url,url1:url1)));
                    _controller.clear();
                    _controller1.clear();
                  }
                },
                child: const Text("Let's try!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




                  