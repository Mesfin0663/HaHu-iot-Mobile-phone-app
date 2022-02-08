import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/signup.dart';
import 'package:new_iot/iotScreens/device1.dart';
import 'package:new_iot/iotScreens/device2.dart';

class Welcome extends StatelessWidget {
  final String title = "Home";
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseApp(),
    );
  }
}

class BaseApp extends StatelessWidget {
  final String title = "Welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title), actions: <Widget>[
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              child: ElevatedButton(
                child: Text('logIN'),
              ),
            ),
            const PopupMenuItem(
              child: ElevatedButton(
                child: Text('sign'),
                
              ),
            ),
          ];
        })
      ]),
      body: Center(),
    );
  }
}
