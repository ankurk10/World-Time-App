import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async      // to use await the function has to be declared as async
  {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: { //passing the data to home
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });  // to navigate to home
  }

  int counter = 0;
  @override
  void initState() {     //used to get data from third party API
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitChasingDots(
          color: Colors.white,
          size: 80,
        ),
      ),

    );
  }
}
