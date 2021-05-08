import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/', //To route to home (overrides the first key value pair in routes map)
    routes: {              //routes is a map similar to a dictionary, expects a key value pair
      '/': (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}

