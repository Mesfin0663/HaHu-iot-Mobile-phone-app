import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:new_iot/home/home.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class device2 extends StatefulWidget {
  device2({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  _device2State createState() =>
      _device2State(uid: this.uid, uname: this.uname, uemail: this.uemail);
}

class _device2State extends State<device2> {
  _device2State({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;
  final dbRef = FirebaseDatabase.instance.reference();
  double _currentSliderValue = 20;

  connection() {
    var connectivityResult = (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
  }

  onUpdate1() {
    setState(() {
      value1 = !value1;
    });
  }

  onUpdate2() {
    setState(() {
      value2 = !value2;
    });
  }

  onUpdate3() {
    setState(() {
      value3 = !value3;
    });
  }

  onUpdate4() {
    setState(() {
      value4 = !value4;
    });
  }

  onUpdate5() {
    setState(() {
      value5 = !value5;
    });
  }

  onUpdate6() {
    setState(() {
      value6 = !value6;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Device 2"),
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                          uid: this.uid,
                          uname: this.uname,
                          uemail: this.uemail)),
                );
              },
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: dbRef
                      .child("users")
                      .child(uid)
                      .child("Devices")
                      .child("Device_2")
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      return Column(children: [
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Connection",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                snapshot.data.snapshot.value["State"]
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                        ])
                      ]);
                    } else {
                      return Column(children: [Column(children: [])]);
                      ;
                    }
                  }),
              StreamBuilder(
                  stream: dbRef
                      .child("users")
                      .child(uid)
                      .child("Devices")
                      .child("Device_2")
                      .child("Sensors")
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.green,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Sensor 1",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    snapshot.data.snapshot
                                                        .value["Sensor_1"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Container(
                                          color: Colors.green,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Sensor 2",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new Row(
                                                  children: [
                                                    new Container(
                                                      child: Text(
                                                          snapshot.data.snapshot
                                                              .value["Sensor_2"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    new Container(
                                                      child: Text("%",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.green,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Sensor 3",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    snapshot.data.snapshot
                                                        .value["Sensor_3"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Container(
                                          color: Colors.green,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Sensor 4",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new Row(
                                                  children: [
                                                    new Container(
                                                      child: Text(
                                                          snapshot.data.snapshot
                                                              .value["Sensor_4"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    new Container(
                                                      child: Text("%",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.green,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Sensor 5",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    snapshot.data.snapshot
                                                        .value["Sensor_5"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Container(
                                          color: Colors.green,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Sensor 6",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: new Row(
                                                  children: [
                                                    new Container(
                                                      child: Text(
                                                          snapshot.data.snapshot
                                                              .value["Sensor_6"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    new Container(
                                                      child: Text("%",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ]),
                        ],
                      );
                    } else
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                  }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: dbRef
                      .child("users")
                      .child(uid)
                      .child("Devices")
                      .child("Device_2")
                      .child("Buttons")
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      return Column(children: [
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    color: Colors.teal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Button 1"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () {
                                                onUpdate1();

                                                writData1();
                                              },
                                              label: snapshot.data.snapshot
                                                      .value["Button_1"]
                                                  ? Text("ON")
                                                  : Text("OFF"),
                                              elevation: 20,
                                              backgroundColor: snapshot
                                                      .data
                                                      .snapshot
                                                      .value["Button_1"]
                                                  ? Colors.yellow
                                                  : Colors.red,
                                              icon: snapshot.data.snapshot
                                                      .value["Button_1"]
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    color: Colors.teal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Button 2"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () {
                                                onUpdate2();

                                                writData2();
                                              },
                                              label: snapshot.data.snapshot
                                                      .value["Button_2"]
                                                  ? Text("ON")
                                                  : Text("OFF"),
                                              elevation: 20,
                                              backgroundColor: snapshot
                                                      .data
                                                      .snapshot
                                                      .value["Button_2"]
                                                  ? Colors.white
                                                  : Colors.pink,
                                              icon: snapshot.data.snapshot
                                                      .value["Button_2"]
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    color: Colors.teal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Button 3"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () {
                                                onUpdate3();

                                                writData3();
                                              },
                                              label: snapshot.data.snapshot
                                                      .value["Button_3"]
                                                  ? Text("ON")
                                                  : Text("OFF"),
                                              elevation: 20,
                                              backgroundColor: snapshot
                                                      .data
                                                      .snapshot
                                                      .value["Button_3"]
                                                  ? Colors.yellow
                                                  : Colors.red,
                                              icon: snapshot.data.snapshot
                                                      .value["Button_3"]
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    color: Colors.teal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Button 4"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () {
                                                onUpdate4();

                                                writData4();
                                              },
                                              label: snapshot.data.snapshot
                                                      .value["Button_4"]
                                                  ? Text("ON")
                                                  : Text("OFF"),
                                              elevation: 20,
                                              backgroundColor: snapshot
                                                      .data
                                                      .snapshot
                                                      .value["Button_4"]
                                                  ? Colors.white
                                                  : Colors.pink,
                                              icon: snapshot.data.snapshot
                                                      .value["Button_4"]
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    color: Colors.teal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Button 5"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () {
                                                onUpdate5();

                                                writData5();
                                              },
                                              label: snapshot.data.snapshot
                                                      .value["Button_5"]
                                                  ? Text("ON")
                                                  : Text("OFF"),
                                              elevation: 20,
                                              backgroundColor: snapshot
                                                      .data
                                                      .snapshot
                                                      .value["Button_5"]
                                                  ? Colors.yellow
                                                  : Colors.red,
                                              icon: snapshot.data.snapshot
                                                      .value["Button_5"]
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    color: Colors.teal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Button 6"),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () {
                                                onUpdate6();

                                                writData6();
                                              },
                                              label: snapshot.data.snapshot
                                                      .value["Button_6"]
                                                  ? Text("ON")
                                                  : Text("OFF"),
                                              elevation: 20,
                                              backgroundColor: snapshot
                                                      .data
                                                      .snapshot
                                                      .value["Button_6"]
                                                  ? Colors.white
                                                  : Colors.pink,
                                              icon: snapshot.data.snapshot
                                                      .value["Button_6"]
                                                  ? Icon(Icons.visibility)
                                                  : Icon(Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ])
                      ]);
                    } else {
                      return Column(children: [Column(children: [])]);
                      ;
                    }
                  })
            ],
          ),
        ));
  }

  Future<void> writData1() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_2")
        .child("Buttons")
        .update({"Button_1": value1});
  }

  Future<void> writData2() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_2")
        .child("Buttons")
        .update({"Button_2": value2});
  }

  Future<void> writData3() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_2")
        .child("Buttons")
        .update({"Button_3": value3});
  }

  Future<void> writData4() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_2")
        .child("Buttons")
        .update({"Button_4": value4});
  }

  Future<void> writData5() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_2")
        .child("Buttons")
        .update({"Button_5": value5});
  }

  Future<void> writData6() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_2")
        .child("Buttons")
        .update({"Button_6": value6});
  }
}
