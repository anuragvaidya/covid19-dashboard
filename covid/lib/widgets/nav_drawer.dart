import 'package:flutter/material.dart';
import 'package:covid/screens/global_summary.dart';
import 'package:covid/screens/countries_list.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red[400]),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.blur_circular),
            title: Text('Global Summary'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GlobalSummary()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Countries'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CountriesList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
