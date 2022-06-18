import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/device1.dart';

class buttonSetting extends StatefulWidget {
  buttonSetting({this.uid, this.uname, this.uemail, this.device});
  final String uid;
  final String uname;
  final String uemail;
  final String device;

  @override
  _buttonSettingState createState() => _buttonSettingState(
      uid: this.uid,
      uname: this.uname,
      uemail: this.uemail,
      device: this.device);
}

class _buttonSettingState extends State<buttonSetting> {
  _buttonSettingState({this.uid, this.uname, this.uemail, this.device});
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
  String button1_Name;
  String button2_Name;
  String button3_Name;
  String button4_Name;
  String button5_Name;
  String button6_Name;
  @override
  void initState() {
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        button1_Name = snapshot.value["Button_1"];
        button2_Name = snapshot.value["Button_2"];
        button3_Name = snapshot.value["Button_3"];
        button4_Name = snapshot.value["Button_4"];
        button4_Name = snapshot.value["Button_5"];
        button5_Name = snapshot.value["Button_6"];
        nameController1 = TextEditingController(text: button1_Name);
        nameController2 = TextEditingController(text: button2_Name);
        nameController3 = TextEditingController(text: button3_Name);
        nameController4 = TextEditingController(text: button4_Name);
        nameController5 = TextEditingController(text: button4_Name);
        nameController6 = TextEditingController(text: button5_Name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Button Setting")),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController1,
                  decoration: InputDecoration(
                    labelText: "Enter Button 1 name",
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
                    labelText: "Enter Button 2 name",
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
                    labelText: "Enter Button 3 name",
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
                    labelText: "Enter Button 4 name",
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
                    labelText: "Enter Button 5 name",
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
                    labelText: "Enter Button_6 name",
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
              )
            ]))));
  }

  void registerToFb() {
    dbRef
      ..child("users")
          .child(uid)
          .child("Devices")
          .child(device)
          .child("Live")
          .child("Buttons")
          .child("names")
          .update({
        "Button_1": nameController1.text,
        "Button_2": nameController2.text,
        "Button_3": nameController3.text,
        "Button_4": nameController4.text,
        "Button_5": nameController5.text,
        "Button_6": nameController6.text,
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
