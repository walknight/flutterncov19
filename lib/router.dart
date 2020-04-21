import 'package:flutter/material.dart';
import 'package:flutterncov19/pages/CountriesDetail.dart';
import 'package:flutterncov19/pages/Credit.dart';
import 'package:flutterncov19/pages/Home.dart';
import 'package:flutterncov19/pages/UndefinedView.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case Home.id:
      return MaterialPageRoute(builder: (context) => Home()); 
    case CountryDetail.id:
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context) => CountryDetail(country: arguments));
    case Credit.id:
      return MaterialPageRoute(builder: (context) => Credit());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}