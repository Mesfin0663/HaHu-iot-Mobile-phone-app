import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:new_iot/home/email_login.dart';
import 'package:new_iot/home/email_signup.dart';

class SignUp extends StatelessWidget {
  final String title = "Welcome ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("ሀሁ IOT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Roboto')),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SignInButton(
                      Buttons.Email,
                      text: "Log In Using Email",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmailLogIn()),
                        );
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SignInButton(
                      Buttons.Email,
                      text: "Sign up with Email",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailSignUp()),
                        );
                      },
                    )),
              ]),
        ));
  }
}
