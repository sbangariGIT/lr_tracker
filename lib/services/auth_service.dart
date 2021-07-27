import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lr_tracker/services/database_services.dart';
// import 'package:lr_tracker/utlis/constant.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {
  await Firebase.initializeApp();
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  print("I am here 1");
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  print("I am here 2");
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  print("I am here 3");
  // Once signed in, return the UserCredential

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User? user = authResult.user;
  if (user != null) {
    DatabaseService()
        .addUser(user.displayName, user.email, user.photoURL, user.uid);
  }
  print("I am here 4");
  return authResult;
}

Future<void> signOutGoogle() async {
  await _auth.signOut();
  await googleSignIn.disconnect();
  print("User Signed Out");
}
