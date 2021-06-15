import 'package:flutter/material.dart';
import 'package:lr_tracker/models/user_location.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child: Text(
            'Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
      ),
    );
  }
}
