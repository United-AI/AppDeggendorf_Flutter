import 'package:deggendorf_app/bottom_navigation_bar_buttons/home_page/weather/weather.dart';
import 'package:flutter/cupertino.dart';

class BackgroundImage {
  String weatherDescription = "";

  BackgroundImage(String weatherDescription) {
    this.weatherDescription = weatherDescription;
  }

  AssetImage currentWeatherBackground() {
    if (weatherDescription != "") {
      switch (weatherDescription) {
        case "clear sky":
          return AssetImage("weather/clear-sky.jpg");
        case "few clouds":
          return AssetImage("weather/few-clouds.jpg");
        case "scattered clouds":
          return AssetImage("weather/scattered-clouds.jpg");
        case "broken clouds":
          return AssetImage("weather/broken-clouds.jpg");
        case "rain":
          return AssetImage("weather/rain.jpg");
        case "thunderstorm":
          return AssetImage("weather/thunderstorm.jpg");
        case "snow":
          return AssetImage("weather/snow.jpg");
        case "mist":
          return AssetImage("weather/mist.jpg");
      }
    }
    for (int i = 0; i < 100; i++) {
      print(weatherDescription);
    }
    return AssetImage("assets/degg.png");
  }
}
