import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teplov_lab2/provider.dart';
import 'my_home_page1.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> InputProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(      
          primarySwatch: Colors.blue,
        ),
        home:  MyHomePage(),
      ),
    );
  }
}