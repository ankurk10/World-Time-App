import 'package:flutter/material.dart';

class Home extends StatefulWidget {   //Stateful Widget is used when there is changing data (State can change over time)
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.fill       // fits the entire container
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  //to push location screen on top when button is pressed
                  setState(() {
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDaytime' : result['isDaytime'],
                      'flag' : result['flag'],
                    };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location"),
              ),

              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 28,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 66,
                ),
              ),

              SizedBox(height: 50),
              Text(
                "Have a great Day",
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 30,
                  color: Colors.black87,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
