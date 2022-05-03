import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'weather.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  late WeatherData weather;

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Deggendorf"),
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: actualWeatherContainer(context))
                ])));
  }
}

Widget actualWeatherContainer(BuildContext context) {
  late WeatherData weather;
  return Padding(
    padding: EdgeInsetsDirectional.all(3),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage('assets/chuttersnap-TSgwbumanuE-unsplash1.jpg'),
              fit: BoxFit.cover)),
      child: FutureBuilder(
        builder: (buildContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            weather = snapshot.data as WeatherData;
            if (weather == null) {
              return const Text("Error getting weather");
            } else {
              return weatherBox(weather);
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
        future: getCurrentWeather(),
      ),
    ),
  );
}



Widget weatherBox(WeatherData weather) {
  return Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 5),
          child: Column(
            children: [
              Text("${weather.temperature}°C",
                  style: GoogleFonts.dancingScript(
                      fontSize: 50,
                      color: Color.fromRGBO(0, 0, 139, 0.7),
                      fontWeight: FontWeight.bold)),
              Text("${weather.description}",
                  style: GoogleFonts.pacifico(
                      fontSize: 25, color: Color.fromRGBO(0, 0, 139, 0.7)))
            ],
          ),
        ),
        SizedBox(width: 30,),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 20, 5, 5),
          child: Column(
            children: [
              Text("Feels:${weather.feelsLike}°C",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 10,),
              Text("Highest: ${weather.high}°C", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 10,),
              Text("Lowest: ${weather.low}°C",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
        )
      ],
    );
}

Future getCurrentWeather() async {
  WeatherData? weather;
  String latitude = "48.8296064"; //coordinates of THD
  String longitude = "12.9542545";
  String apiKey = "bdfd87b51211cb50b78a20c889a500b3";
  var url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    weather = WeatherData.fromJson(jsonDecode(response.body));
    return weather;
  } else {
    weather = null;
    FlutterError.presentError;
  }
}

