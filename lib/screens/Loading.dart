// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:simple_location_picker/simple_location_result.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';



import '../models/weather.dart';class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
  String apiKey="a067c8f6765598d3b922ee768efbfdd1";
  SimpleLocationResult arguments;
  getData({lat,lon})async{
    String latitude=lat==null?"54.980838475370945"   :lat.toString();
    String longitude=lon==null?"73.37289239157745"   :lon.toString();

    Response response = await get(
      "http://api.openweathermap.org/data/2.5/weather?units=metric&lat=$latitude&lon=$longitude&appid=$apiKey");
    Map data=jsonDecode(response.body);

    Navigator.pushReplacementNamed(context, '/weather',
    arguments: {
      "weatherData":WeatherData.fromJson((data) as Map<String, dynamic>),
      "selectedLocation":arguments
    });
  }

  @override
  Widget build(BuildContext context){
    arguments=ModalRoute.of(context)?.settings.arguments as SimpleLocationResult;
    Future.delayed(const Duration(seconds: 1),() =>{
      arguments !=null?getData(lat: arguments.latitude, lon:arguments.longitude): getData()
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [LottieBuilder.asset("assets/loading.json")],
      )
    );
  }
}
