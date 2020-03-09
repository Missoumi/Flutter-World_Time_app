import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTime.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location:'Cairo' , url:'Africa/Cairo' , flag:'egypte.png' ),
    WorldTime(location:'Tunis' , url:'Africa/Tunis' , flag:'Tunis.png' ),
    WorldTime(location:'Jamaica' , url:'America/Jamaica' , flag:'Jamaica.png' ),
    WorldTime(location:'Toronto' , url:'America/Toronto' , flag:'America.png' ),
    WorldTime(location:'London' , url:'Europe/London' , flag:'UK.png' ),
    WorldTime(location:'Madrid' , url:'Europe/Madrid' , flag:'Spain.png' ),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'flag': worldTime.flag,
      'location': worldTime.location,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
              ),
            ),
          );
        }
      ),
    );
  }
}