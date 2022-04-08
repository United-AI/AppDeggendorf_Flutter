import 'package:deggendorf_app/bottom_navigation_bar_buttons/home_page/weather/current_weather.dart';
import 'package:flutter/cupertino.dart';

class MyList {
  List<Widget> myList = [];
  MyList(BuildContext buildContext) {
    myList = [
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
  }

}
