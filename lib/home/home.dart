import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/signup.dart';
import 'package:new_iot/iotScreens/device1.dart';
import 'package:new_iot/iotScreens/device2.dart';
import 'package:new_iot/iotScreens/device3.dart';
import 'package:new_iot/iotScreens/device4.dart';
import 'package:new_iot/iotScreens/device5.dart';

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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(
                    "Welcome " + uname,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Center(
                      child: Text(
                        "Dear User You Have the following devices",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 63, 174, 226),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      child: const Text("Device 1"),
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
                    child: ElevatedButton(
                      child: Text("Device 2"),
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
                    child: ElevatedButton(
                      child: Text("Device 3"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Location3(
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
                    child: ElevatedButton(
                      child: Text("Device 4"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Location4(
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
                    child: ElevatedButton(
                      child: Text("Device 5"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Location5(
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
            accountEmail: Column(
              children: [
                Text(uemail),
                Text(uid),
              ],
            ),
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
  Location1({this.uid, this.uemail, this.uname});
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

class Location3 extends StatelessWidget {
  Location3({this.uid, this.uemail, this.uname});
  final String uid;
  final String uname;
  final String uemail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: device3(uid: this.uid, uname: this.uname, uemail: this.uemail),
    );
  }
}

class Location4 extends StatelessWidget {
  Location4({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: device4(uid: this.uid, uname: this.uname, uemail: this.uemail),
    );
  }
}

class Location5 extends StatelessWidget {
  Location5({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: device5(uid: this.uid, uname: this.uname, uemail: this.uemail),
    );
  }
}
