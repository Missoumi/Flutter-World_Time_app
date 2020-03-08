import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {

  String time;
  String flag;
  String url;
  String location;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map res = jsonDecode(response.body);
    DateTime date_time = DateTime.parse(res['datetime']);
    int offset = int.parse(res['utc_offset'].substring(1,3));
    date_time = date_time.add(Duration(hours: offset));
    
    isDayTime = date_time.hour > 6 && date_time.hour < 20 ? true : false;
    time = DateFormat.jm().format(date_time);
  }

}