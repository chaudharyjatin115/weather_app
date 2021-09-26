class Hourly {
  final int? dt;
  var temp;
  final int? condition;

  Hourly({
    this.dt,
    this.condition,
    this.temp,
  });

  // static Hourly fromJson(json) {
  //   return Hourly(
  //     dt: json[0]['dt'].toInt(),
  //     temp: json[0]['temp'].toDouble(),
  //     condition: json['weather'][0]['id'],
  //   );
  // }
  List<Hourly> HourlyfromJson(Map<String, dynamic> json) {
    // ignore: unused_local_variable
    final List<Hourly> hours = [];
    for (final item in json['hourly']) {
      hours.add(
        Hourly(
          temp: item['temp'],
          dt: item['dt'],
          condition: item['weather'][0]['id'],
        ),
      );
    }
    return hours;
  }
}
