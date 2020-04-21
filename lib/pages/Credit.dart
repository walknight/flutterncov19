import 'package:flutter/material.dart';

class Credit extends StatelessWidget {
  static const String id = '/credit';

  final imageCircle = Padding(
    padding: EdgeInsets.all(10.0),
    child: CircleAvatar(
      radius: 72.0,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/logo_ifcode_potrait_putih.png'),
    ),
  );

  final title = Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'Thanks for use this Application',
      style: TextStyle(fontSize: 20.0, color: Colors.white),
    ),
  );

  final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'This appilcation was build for people who want to check daily activity case about Corona Virus COVID-19 in all country who have similiar cases today. I hope everybody will be helped. Feel free to modify and used this app for your study about flutter. Source code can be found at my git.',
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Credits',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),          
          SizedBox(height: 10.0,),
          Text(
            'API : https://github.com/novelcovid/api\n UI : https://github.com/mahtab-ali/fitness_app_ui',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          SizedBox(height: 25.0,),
          Text(
            'License MIT',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          SizedBox(height: 20.0,),          
          Text(
            'Build with love by ifthenuk.',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Credit"),
      ),
      body: SingleChildScrollView(child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigo,
            Colors.indigoAccent,
          ]),
        ),
        child: Column(
          children: <Widget>[imageCircle, title, lorem],
        ),
      ),)
    );
  }
}
