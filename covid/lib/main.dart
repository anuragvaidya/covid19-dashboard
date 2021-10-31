import 'package:flutter/material.dart';
// import 'package:covid/screens/countries_list.dart';
import 'package:covid/screens/global_summary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          color: Colors.grey[850],
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.grey[700],
      ),
      home: GlobalSummary(),
    );
  }
}
