import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/device1.dart';

class mainSetting extends StatefulWidget {
  mainSetting({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  _mainSettingState createState() =>
      _mainSettingState(uid: this.uid, uname: this.uname, uemail: this.uemail);
}

class _mainSettingState extends State<mainSetting> {
  _mainSettingState({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  TextEditingController nameController5 = TextEditingController();
  TextEditingController nameController6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sensor Setting")),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController1,
                  decoration: InputDecoration(
                    labelText: "Enter Sensor1 name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'name is empity';
                    } else if (value.length > 15) {
                      return 'Characters hould be less than 15';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController2,
                  decoration: InputDecoration(
                    labelText: "Enter Sensor2 name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'name is empity';
                    } else if (value.length > 15) {
                      return 'Characters hould be less than 15';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController3,
                  decoration: InputDecoration(
                    labelText: "Enter Sensor3 name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'name is empity';
                    } else if (value.length > 15) {
                      return 'Characters hould be less than 15';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlue)
                                
                                ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            registerToFb();
                          }
                        },
                        child: Text('Submit'),
                      ),
              )
            ]))));
  }

  void registerToFb() {
    dbRef
      ..child("users")
          .child(uid)
          .child("Devices")
          .child("Device_1")
          .child("Live")
          .child("Sensors")
          .child("names")
          .update({
        "Sensor_1": nameController1.text,
        "Sensor_2": nameController2.text,
        "Sensor_3": nameController3.text,
      }).then((result) {
        isLoading = false;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => device1(
                    uid: this.uid,
                    uname: this.uname,
                    uemail: this.uemail,
                  )),
        );
      });
  }

  @override
  void dispose() {
    super.dispose();
    nameController1.dispose();
    nameController2.dispose();
    nameController3.dispose();
    nameController4.dispose();
    nameController5.dispose();
    nameController6.dispose();
  }
}
