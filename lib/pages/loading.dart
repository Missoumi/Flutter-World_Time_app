import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  

  void getWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin/');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': worldTime.flag,
      'location': worldTime.location,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.white, 
          size: 50.0
        )
      ),
    );
  }
}
