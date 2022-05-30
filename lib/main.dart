import 'package:flutter/material.dart';
import 'package:wappy_heather/screens/Loading.dart';
import 'package:wappy_heather/screens/Weather.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/loading':(context)=>Loading(key: key as Key),
        'weather':(context)=>Weather( key: key as Key),
      }
    );
  }
}
