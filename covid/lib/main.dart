import 'package:flutter/material.dart';
import 'package:covid/screens/countries_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountriesList(),
    );
  }
}
