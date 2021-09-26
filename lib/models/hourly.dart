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
<<<<<<< HEAD
    // ignore: unused_local_variable
    final List<Hourly> hours = [];
=======
    // final hours = List.generate(json.length, (index) => Hourly());
    // this actually creates $json.length empty items in list
    // and adds new fetched to list.

    final List<Hourly> hours = []; // empty list

>>>>>>> 06ba8c74b3a1e68f2b4e183f6c9f2da0571b355e
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
