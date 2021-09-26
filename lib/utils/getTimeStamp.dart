import 'package:intl/intl.dart';

String getTimeFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('h:mm a');
  return formatter.format(date);
}

String getDateFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('E');
  return formatter.format(date);
}
