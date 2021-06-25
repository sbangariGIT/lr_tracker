import 'package:flutter/material.dart';
import 'package:lr_tracker/views/log_in.dart';
import 'package:provider/provider.dart';

import 'models/user_location.dart';
import 'services/location_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        initialData: new UserLocation(latitude: 0, longitude: 0),
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
            title: 'lr_tracking',
            debugShowCheckedModeBanner: false,
            home: Login()));
  }
}
