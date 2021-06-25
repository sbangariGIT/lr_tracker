import 'package:flutter/material.dart';
import 'package:lr_tracker/views/log_in.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController phoneTextEditingController =
      new TextEditingController();
  final formkeys = GlobalKey<FormState>();
  signUpcommand() async {
    // if (formkeys.currentState.validate()) {
    //   await authService
    //       .signUpWithEmailAndPassword(emailTextEditingController.text,
    //           passwordTextEditingController.text)
    //       .then((result) {
    //     if (result != null) {
    //       Map<String, String> userDataMap = {
    //         "userName": nameTextEditingController.text,
    //         "userEmail": emailTextEditingController.text,
    //         "userPhone": phoneTextEditingController.text
    //       };
    //       HelperFunctions.saveUserLoggedInSharedPreference(true);
    //       HelperFunctions.saveUserNameSharedPreference(
    //           nameTextEditingController.text);
    //       HelperFunctions.saveUserEmailSharedPreference(
    //           emailTextEditingController.text);
    //       databaseMethods.addUserInfo(userDataMap);
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute(builder: (context) => display()));
    //     }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Let's get Started!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Form(
                                key: formkeys,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide())),
                                      child: TextFormField(
                                        // validator: (val) {
                                        //   return val.isEmpty
                                        //       ? "Please Enter a Name"
                                        //       : null;
                                        // },
                                        controller: nameTextEditingController,
                                        decoration: InputDecoration(
                                            hintText: "Name",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide())),
                                      child: TextFormField(
                                        // validator: (val) {
                                        //   return RegExp(
                                        //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        //           .hasMatch(val)
                                        //       ? null
                                        //       : "Please Enter Correct Email";
                                        // },
                                        controller: emailTextEditingController,
                                        decoration: InputDecoration(
                                            hintText: "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide())),
                                      child: TextFormField(
                                        obscureText: true,
                                        // validator: (val) {
                                        //   return val.length > 6
                                        //       ? null
                                        //       : "Enter Password 6+ characters";
                                        // },
                                        controller:
                                            passwordTextEditingController,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide())),
                                      child: TextFormField(
                                        obscureText: true,
                                        // validator: (val) {
                                        //   return val.length > 6
                                        //       ? null
                                        //       : "Enter a valid phone number";
                                        // },
                                        controller: phoneTextEditingController,
                                        decoration: InputDecoration(
                                            hintText: "Phone Number",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                            onTap: () {
                              signUpcommand();
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.orange[900]),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Have an Account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.black),
                                    child: Center(
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
