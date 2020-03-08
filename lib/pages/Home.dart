import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg' ;
    Color scaffold_color = data['isDayTime'] ? Colors.grey[300] : Colors.blue[900];

    return Scaffold(
      backgroundColor: scaffold_color,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 20),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Edit location",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
