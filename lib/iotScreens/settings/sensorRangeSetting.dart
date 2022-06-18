import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/device1.dart';

class sensorRangeSetting extends StatefulWidget {
  sensorRangeSetting({this.uid, this.uname, this.uemail, this.device});
  final String uid;
  final String uname;
  final String uemail;
  final String device;
  @override
  _sensorRangeSettingState createState() => _sensorRangeSettingState(
      uid: this.uid,
      uname: this.uname,
      uemail: this.uemail,
      device: this.device);
}

class _sensorRangeSettingState extends State<sensorRangeSetting> {
  _sensorRangeSettingState({this.uid, this.uname, this.uemail, this.device});
  final String uid;
  final String uname;
  final String uemail;
  final String device;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference db1 = FirebaseDatabase.instance.reference();
  var sensor1_Max;
  var sensor1_Min;
  var sensor2_Max;
  var sensor2_Min;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  TextEditingController nameController1Min;
  TextEditingController nameController1Max;
  TextEditingController nameController2Min;
  TextEditingController nameController2Max;
  TextEditingController nameController3Min ;
  TextEditingController nameController3Max ;
    TextEditingController nameController4Min ;
  TextEditingController nameController4Max ;
    TextEditingController nameController5Min ;
  TextEditingController nameController5Max ;
    TextEditingController nameController6Min ;
  TextEditingController nameController6Max ;
  @override
  void initState() {
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("Range")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
     
        nameController1Min = TextEditingController(text: snapshot.value["Sensor_1"]["Min"].toString());
        nameController1Max = TextEditingController(text: snapshot.value["Sensor_1"]["Max"].toString());
        nameController2Min = TextEditingController(text: snapshot.value["Sensor_2"]["Min"].toString());
        nameController2Max = TextEditingController(text:snapshot.value["Sensor_2"]["Max"].toString());
            
        nameController3Min = TextEditingController(text: snapshot.value["Sensor_3"]["Min"].toString());
        nameController3Max = TextEditingController(text: snapshot.value["Sensor_3"]["Max"].toString());
        nameController4Min = TextEditingController(text: snapshot.value["Sensor_4"]["Min"].toString());
        nameController4Max = TextEditingController(text:snapshot.value["Sensor_4"]["Max"].toString());
            
        nameController5Min = TextEditingController(text: snapshot.value["Sensor_5"]["Min"].toString());
        nameController5Max = TextEditingController(text: snapshot.value["Sensor_5"]["Max"].toString());
        nameController6Min = TextEditingController(text: snapshot.value["Sensor_6"]["Min"].toString());
        nameController6Max = TextEditingController(text:snapshot.value["Sensor_6"]["Max"].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sensor Range Setting")),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: nameController1Min,
                  decoration: InputDecoration(
                    labelText: "Sensor1 Minimum Value",
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
                  controller: nameController1Max,
                  decoration: InputDecoration(
                    labelText: "Sensor1 Maximum value",
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
                  controller: nameController2Min,
                  decoration: InputDecoration(
                    labelText: "Sensor2 Minimum Value",
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
                  controller: nameController2Max,
                  decoration: InputDecoration(
                    labelText: "Sensor2 Maximum value",
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
                  controller: nameController3Min,
                  decoration: InputDecoration(
                    labelText: "Sensor3 Minimum value",
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
                  controller: nameController3Max,
                  decoration: InputDecoration(
                    labelText: "Sensor3 Maximum value",
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
                  controller: nameController4Min,
                  decoration: InputDecoration(
                    labelText: "Sensor4 Minimum value",
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
                  controller: nameController4Max,
                  decoration: InputDecoration(
                    labelText: "Sensor4 Maximum value",
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
                  controller: nameController5Min,
                  decoration: InputDecoration(
                    labelText: "Sensor5 Minimum value",
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
                  controller: nameController5Max,
                  decoration: InputDecoration(
                    labelText: "Sensor5 Maximum value",
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
                  controller: nameController6Min,
                  decoration: InputDecoration(
                    labelText: "Sensor6 Minimum value",
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
                  controller: nameController6Max,
                  decoration: InputDecoration(
                    labelText: "Sensor6 Maximum value",
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
          .child("Sensors")
          .child("Range")
          .update({
        "Sensor_1": {
          "Min": int.parse(nameController1Min.text),
          "Max": int.parse(nameController1Max.text),
        },"Sensor_2":{
          "Min": int.parse(nameController2Min.text),
          "Max": int.parse(nameController2Max.text),
        },"Sensor_3":{
          "Min": int.parse(nameController3Min.text),
          "Max": int.parse(nameController3Max.text),
        },"Sensor_4":{
          "Min": int.parse(nameController4Min.text),
          "Max": int.parse(nameController4Max.text),
        },"Sensor_5":{
          "Min": int.parse(nameController5Min.text),
          "Max": int.parse(nameController5Max.text),
        },"Sensor_6":{
          "Min": int.parse(nameController6Min.text),
          "Max": int.parse(nameController6Max.text),
        }
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
    nameController1Min.dispose();
    nameController1Max.dispose();
    nameController2Min.dispose();
    nameController2Max.dispose();
    nameController3Min.dispose();
    nameController3Max.dispose();
  }
}
