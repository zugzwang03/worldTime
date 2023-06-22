// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location = "location name";
  String time = "time";
  String flag = "url to asset fileicon";
  String url = "location url for api endpoints";
  bool isDayTime = false;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    print(data);
    String offset = data['utc_offset'];
    String hours = offset.substring(1, 3);
    String minutes = offset.substring(4);

    String datetime = data['datetime'];
    print(datetime);
    DateTime now = DateTime.parse(datetime);
    print(now);
    now = now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
    isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
    time = DateFormat.jm().format(now);
  }
}
