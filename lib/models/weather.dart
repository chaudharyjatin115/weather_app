class Weather {
  final double? temp;
  final double? condition;

  final int? humidity;
  final double? windSpeed;
  final String? weatherMessage;
  final String? cityname;

  Weather({
    this.temp,
    this.condition,
    this.cityname,
    this.humidity,
    this.windSpeed,
    this.weatherMessage,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
      condition: json['weather'][0]['id'],
      cityname: json['name'],
      weatherMessage: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
    );
  }
}
