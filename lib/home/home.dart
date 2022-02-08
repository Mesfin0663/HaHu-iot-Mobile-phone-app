import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/signup.dart';
import 'package:new_iot/iotScreens/device1.dart';
import 'package:new_iot/iotScreens/device2.dart';

class Home extends StatelessWidget {
  Home({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  final String title = "Home";
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseApp(uid: this.uid, uname: this.uname, uemail: this.uemail),
    );
  }
}

class BaseApp extends StatelessWidget {
  BaseApp({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  final String title = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: Icon(Icons.menu),
          title: Text(title),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                      (Route<dynamic> route) => false);
                });
              },
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome " + uname,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Dear User You Have the following devices"),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 150,
                  child: FlatButton(
                    child: Text("Device 1"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Location1(
                                uid: this.uid,
                                uname: this.uname,
                                uemail: this.uemail)),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: FlatButton(
                    child: Text("Device 2"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Location2(
                                uid: this.uid,
                                uname: this.uname,
                                uemail: this.uemail)),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: FlatButton(
                    child: Text("Device 3"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Location1(
                                uid: this.uid,
                                uname: this.uname,
                                uemail: this.uemail)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: NavigateDrawer(
            uid: this.uid, uemail: this.uemail, uname: this.uname));
  }
}

class NavigateDrawer extends StatefulWidget {
  NavigateDrawer({this.uid, this.uemail, this.uname});
  final String uid;
  final String uemail;
  final String uname;

  @override
  _NavigateDrawerState createState() => _NavigateDrawerState(
      uid: this.uid, uname: this.uname, uemail: this.uemail);
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  _NavigateDrawerState({this.uid, this.uname, this.uemail});
  final String uid;
  final String uemail;
  final String uname;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(uname),
            accountEmail: Text(uemail),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Home'),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home(
                        uid: this.uid, uname: this.uname, uemail: this.uemail)),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.settings, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class Location1 extends StatelessWidget {
  Location1({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: device1(uid: this.uid, uname: this.uname, uemail: this.uemail),
    );
  }
}

class Location2 extends StatelessWidget {
  Location2({this.uid, this.uemail, this.uname});
  final String uid;
  final String uname;
  final String uemail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: device2(uid: this.uid, uname: this.uname, uemail: this.uemail),
    );
  }
}
