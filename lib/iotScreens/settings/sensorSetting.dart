import 'package:control_pad/views/joystick_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/device1.dart';

class sensorSetting extends StatefulWidget {
  sensorSetting({this.uid, this.uname, this.uemail, this.device});
  final String uid;
  final String uname;
  final String uemail;
  final String device;
  @override
  _sensorSettingState createState() => _sensorSettingState(
      uid: this.uid,
      uname: this.uname,
      uemail: this.uemail,
      device: this.device);
}

class _sensorSettingState extends State<sensorSetting> {
  _sensorSettingState({this.uid, this.uname, this.uemail, this.device});
  final String uid;
  final String uname;
  final String uemail;
  final String device;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  final DatabaseReference db1 = FirebaseDatabase.instance.reference();

  TextEditingController nameController1;
  TextEditingController nameController2;
  TextEditingController nameController3;
  TextEditingController nameController4;
  TextEditingController nameController5;
  TextEditingController nameController6;
  String sensor1_Name;
  String sensor2_Name;
  String sensor3_Name;
  String sensor4_Name;
  String sensor5_Name;
  String sensor6_Name;
  @override
  void initState() {
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        sensor1_Name = snapshot.value["Sensor_1"];
        sensor2_Name = snapshot.value["Sensor_2"];
        sensor3_Name = snapshot.value["Sensor_3"];
        sensor4_Name = snapshot.value["Sensor_4"];
        sensor5_Name = snapshot.value["Sensor_5"];
        sensor6_Name = snapshot.value["Sensor_6"];
        nameController1 = TextEditingController(text: sensor1_Name);
        nameController2 = TextEditingController(text: sensor2_Name);
        nameController3 = TextEditingController(text: sensor3_Name);
        nameController4 = TextEditingController(text: sensor4_Name);
        nameController5 = TextEditingController(text: sensor5_Name);
        nameController6 = TextEditingController(text: sensor6_Name);
      });
    });
  }

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
                child: TextFormField(
                  controller: nameController4,
                  decoration: InputDecoration(
                    labelText: "Enter Sensor4 name",
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
                  controller: nameController5,
                  decoration: InputDecoration(
                    labelText: "Enter Sensor5 name",
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
                  controller: nameController6,
                  decoration: InputDecoration(
                    labelText: "Enter Sensor6 name",
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
                                Colors.lightBlue)),
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
              ),
              JoystickView(
                onDirectionChanged: onDirectionChanged,
              ),
            ]))));
  }

  JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
    String data =
        "Degree : ${degrees.toStringAsFixed(2)}, distance : ${distance.toStringAsFixed(2)}";
    print(degrees);
  }

  void registerToFb() {
    dbRef
      ..child("users")
          .child(uid)
          .child("Devices")
          .child(device)
          .child("Live")
          .child("Sensors")
          .child("names")
          .update({
        "Sensor_1": nameController1.text,
        "Sensor_2": nameController2.text,
        "Sensor_3": nameController3.text,
        "Sensor_4": nameController4.text,
        "Sensor_5": nameController5.text,
        "Sensor_6": nameController6.text,
      }).then((result) {
        isLoading = false;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
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
