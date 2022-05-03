import 'package:deggendorf_app/bin/main.dart';
import 'package:deggendorf_app/bottom_navigation_bar_buttons/home_page/weather/weather_block.dart';
import 'package:flutter/cupertino.dart';

class MyList {

  List<Widget> myListToBeDisplayed = [];
  List<Widget> myListToBeTappedOn = [];

  MyList(BuildContext buildContext) {
    myListToBeDisplayed = [
      actualWeatherContainer(buildContext),
      Text("Input your widget here"),
      Text("Input your widget here"),
      Text("Input your widget here"),
      Text("Input your widget here"),
      Text("Input your widget here"),
      Text("Input your widget here"),
      Text("Input your widget here"),
      Text("Input your widget here"),
    ];

    myListToBeTappedOn = [
      CurrentWeather(),
      SecondRoute(),
      SecondRoute(),
      SecondRoute(),
      SecondRoute(),
      SecondRoute(),
      SecondRoute(),
      SecondRoute(),
      SecondRoute(),
    ];
  }

}
