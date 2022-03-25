import 'my_home_page2.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageFromState();
}

class _MyHomePageFromState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  bool texterror = false;

  @override
  void initState() {
    _controller.text = "";
    _controller1.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("WeatherBit API"),
      ),
      body: Center (
        
        child: Container(
          margin: const EdgeInsets.all(15.0),
          color: Color.fromARGB(255, 218, 233, 233),
          width: 1200,
          height: 500,
          
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
                    
                    decoration: InputDecoration(
                      labelText: 'Lan',
                      errorText: texterror ? 'Print correct URL' : null,
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
                    
                    decoration: InputDecoration(
                      labelText: 'Lon',
                      errorText: texterror ? 'Print correct URL' : null,
                    ),
                  ),
                ),
              ),
              



              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty ) {
                    setState(() {
                      texterror = true;
                    });
                  } else {
                    setState(() {
                      texterror = false;
                    });
                    String url = _controller.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(url: url),
                        
                      ),
                    );
                    _controller.clear();
                  }
                },
                child: const Text("Check"),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
