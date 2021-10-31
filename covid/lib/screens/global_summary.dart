import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid/models/summary.dart';
import 'package:covid/widgets/nav_drawer.dart';
import 'package:covid/widgets/status_tile.dart';

class GlobalSummary extends StatefulWidget {
  const GlobalSummary({Key? key}) : super(key: key);

  @override
  _GlobalSummaryState createState() => _GlobalSummaryState();
}

class _GlobalSummaryState extends State<GlobalSummary> {
  bool loading = true;
  Summary? summary;

  void getSummary() async {
    var url = Uri.https('api.covid19api.com', '/summary');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      summary = Summary.fromJson(data['Global']);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Summary'),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ((summary != null)
              ? GridView.count(
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: <Widget>[
                    StatusTile(
                      title: 'New Confirmed',
                      content: summary?.newConfirmed.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Total Confirmed',
                      content: summary?.totalConfirmed.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'New Deaths',
                      content: summary?.newDeaths.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Total Deaths',
                      content: summary?.totalDeaths.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'New Recovered',
                      content: summary?.newRecovered.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Total Recovered',
                      content: summary?.totalRecovered.toString() ?? 'Error',
                    ),
                  ],
                )
              : Center(
                  child: Text('Error fetching data!'),
                )),
    );
  }
}
