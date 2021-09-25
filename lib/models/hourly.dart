class Hourly {
  final int? dt;
  final double? temp;
  final String? name;
  final double? condition;

  Hourly({
    this.dt,
    this.condition,
    this.temp,
    this.name,
  });

  // static Hourly fromJson(json) {
  //   return Hourly(
  //     dt: json[0]['dt'].toInt(),
  //     temp: json[0]['temp'].toDouble(),
  //     condition: json['weather'][0]['id'],
  //   );
  // }
  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      name: json['name'],
      temp: json[0]['temp'].toDouble(),
      condition: json['weather'][0]['id'],
    );
  }
}
