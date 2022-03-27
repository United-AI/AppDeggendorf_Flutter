class WeatherData {
  final double temperature;
  final double feelsLike;
  final double low;
  final double high;
  final String description;

  WeatherData({required this.temperature, required this.feelsLike, required this.low, required this.high, required this.description});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }

}