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
  bool texterror = false;

  @override
  void initState() {
    _controller.text = "";
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.green,
            ),
          ),
          width: 1200,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 100),
                
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Print your http',
                    style: TextStyle(fontSize: 25, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(      
                  width: 400,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Your URL',
                      errorText: texterror ? 'Print correct URL' : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty || !isURL(_controller.text)) {
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
