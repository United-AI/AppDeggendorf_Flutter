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
          return AssetImage(
              "weather/clear-sky.jpg"); //https://pixabay.com/de/photos/sonne-himmel-blau-sonnenlicht-3588618/
        case "few clouds":
          return AssetImage("weather/few-clouds.jpg");
        case "scattered clouds":
          return AssetImage(
              "weather/scattered-clouds.jpg"); //https://de.freepik.com/fotos-kostenlos/aufgelockerte-bewoelkung_949086.htm#query=scattered%20clouds&position=49&from_view=search
        case "broken clouds":
          return AssetImage(
              "weather/broken-clouds.jpg"); //https://pixabay.com/de/photos/wolken-himmel-atmosph%c3%a4re-7050884/
        case "rain":
          return AssetImage(
              "weather/rain.jpg"); //https://unsplash.com/photos/192qmJI9c28
        case "thunderstorm":
          return AssetImage(
              "weather/thunderstorm.jpg"); //https://www.pexels.com/de-de/foto/blitz-2947810/
        case "snow":
          return AssetImage(
              "weather/snow.jpg"); //https://unsplash.com/photos/KHDeVpytLuU
        case "mist":
          return AssetImage(
              "weather/mist.jpg"); //https://unsplash.com/photos/YmsrXcDf0J8
      }
    }
    return AssetImage("assets/degg.png");
  }
}
