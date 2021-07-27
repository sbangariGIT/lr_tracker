import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lr_tracker/models/user_location.dart';
import 'package:lr_tracker/services/auth_service.dart';
import 'package:lr_tracker/services/database_services.dart';
import 'package:lr_tracker/views/log_in.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var lon;
  var lat;
  late Stream<QuerySnapshot> locationList;
  ScrollController _controller = ScrollController();
  List<String> needs = [];

  @override
  void initState() {
    print("I am here");
    getUsers(); //Getting the chats of the particular user
    super.initState();
  }

  getUsers() async {
    print("RajiniKanth");
    DatabaseService().getOthersLocations().then((snapshot) {
      locationList = snapshot;
    });
  }

  Widget getUserTaskList() {
    QuerySnapshot qShot = DatabaseService().getOthersLocations();
    return ListView.builder(
        controller: _controller,
        itemCount: qShot.docs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(qShot.docs[index].metadata.toString()),
          );
        });
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: locationList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              reverse: true,
              controller: _controller,
              itemCount: 2,
              itemBuilder: (context, index) {
                String current = snapshot.data;
                return ListTile(
                  title: Text(current),
                );
              });
        } else {
          return Center(
            child: Container(
              child: Text("No Friends"),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    if (lat != userLocation.latitude && lon != userLocation.longitude) {
      lat = userLocation.latitude;
      lon = userLocation.longitude;
      DatabaseService().updateLocation('KdCdnG30HaTnzatfc7aQj9SI6ub2',
          userLocation.latitude, userLocation.longitude);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Yo! Wassup boys"),
        leading: GestureDetector(
          onTap: () async {
            signOutGoogle().then((_) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            });
          },
          child: Container(
            child: Text("Log out"),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[chatMessages()],
            ),
          ),
          Center(
            child: Text(
                'Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
          ),
        ],
      ),
    );
  }
}
