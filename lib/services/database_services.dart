import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  /*
  This method calls back all the locations and other details of users registered in this app, note the limit
  Parameters: teamId: unique teamId, limit: int which limits the number of documents
  NOTE : Use this function with async/await
  */
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(
      String? fullName, String? email, String? photoUrl, String? userId) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(userId)
        .set({
          'full_name': fullName,
          'company': 126,
          'email': email,
          'photo_url': photoUrl,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  getOthersLocations() async {
    print("Yo Bro Wassup");
    return FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future<void> updateLocation(String? userId, double? lat, double? long) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(userId)
        .update({
          'latitude': lat,
          'longitude': long,
        })
        .then((value) => print("Location Updated"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
