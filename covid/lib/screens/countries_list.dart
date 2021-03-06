import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid/models/country.dart';
import 'package:covid/screens/detail.dart';
import 'package:covid/widgets/nav_drawer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  bool loading = true;
  List<Country> countries = [];

  void getCountries() async {
    var url = Uri.https('api.covid19api.com', '/countries');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var c in data) {
        Country country = Country.fromJson(c);
        countries.add(country);
      }

      countries.sort((a, b) => a.country.compareTo(b.country));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ((countries.length > 0)
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(countries[index].country),
                        tileColor: Colors.white,
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryDetailPage(
                                country: countries[index].country,
                                slug: countries[index].slug,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: countries.length,
                )
              : Center(
                  child: Text('No countries to show!'),
                )),
    );
  }
}
