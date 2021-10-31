import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid/models/country_detail.dart';
import 'package:covid/widgets/status_tile.dart';

class CountryDetailPage extends StatefulWidget {
  final String country;
  final String slug;

  const CountryDetailPage({Key? key, required this.country, required this.slug})
      : super(key: key);

  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  bool loading = true;
  CountryDetail? detail;

  void getCountryDetail() async {
    var url = Uri.https('api.covid19api.com', '/total/country/' + widget.slug);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      detail = CountryDetail.fromJson(data.last);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCountryDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country),
        centerTitle: true,
      ),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ((detail != null)
              ? GridView.count(
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: <Widget>[
                    StatusTile(
                      title: 'Confirmed',
                      content: detail?.confirmed.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Deaths',
                      content: detail?.deaths.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Recovered',
                      content: detail?.recovered.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Active',
                      content: detail?.active.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Latitude',
                      content: detail?.lat.toString() ?? 'Error',
                    ),
                    StatusTile(
                      title: 'Longitude',
                      content: detail?.lon.toString() ?? 'Error',
                    ),
                  ],
                )
              : Center(
                  child: Text('Error fetching data!'),
                )),
    );
  }
}
