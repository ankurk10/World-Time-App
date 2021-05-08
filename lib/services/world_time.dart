import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;    //location name for the UI
  String time;        // the time in that location
  String flag;        // url to an asset flag icon
  String url;         // location url for api endpoint
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url}) ; //Constructor will receive the values when a new instance of the class is created

  Future<void> getTime() async{
  //async let your program complete work while waiting for another operation to finish
  //Future<void> returns void when the async function is fully complete. Future is temp placeholder value


    try{            // if code in try function doesn't work then the code in catch is executed
      //make the request
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour>6 && now.hour<20 ? true:false;
      //set the time property
      time = DateFormat.jm().format(now);

    }

    catch(e)
    {
      print("caught error : $e");
      time = "could not get time data";
    }


  }

}

