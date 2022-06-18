import 'package:connectivity/connectivity.dart';
import 'package:control_pad/control_pad.dart';
import 'package:control_pad/models/gestures.dart';
import 'package:control_pad/views/pad_button_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/settings/buttonSetting.dart';
import 'package:new_iot/iotScreens/settings/sensorSetting.dart';
import 'package:new_iot/iotScreens/settings/sensorRangeSetting.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

import '../notification/notification.dart';

class device1 extends StatefulWidget {
  device1({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  _device1State createState() =>
      _device1State(uid: this.uid, uname: this.uname, uemail: this.uemail);
}

class _device1State extends State<device1> {
  _device1State({this.uid, this.uname, this.uemail});
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
  int val;
  int prev;
  var value;
  var sensor1_Max;
  var sensor1_Min;
  var sensor2_Max;
  var sensor2_Min;
  var sensor3_Max;
  var sensor3_Min;
  var sensor4_Max;
  var sensor4_Min;
  var sensor5_Max;
  var sensor5_Min;
  var sensor6_Max;
  var sensor6_Min;
  String Sensor_1 = "";
  String Sensor_2 = "";
  String Sensor_3 = "";
  String Sensor_4 = "";
  String Sensor_5 = "";
  String Sensor_6 = "";
  String Button_1 = "";
  String Button_2 = "";
  String Button_3 = "";
  String Button_4 = "";
  String Button_5 = "";
  String Button_6 = "";
  var sensor1Val;
  var sensor2Val;
  var sensor3Val;
  var sensor4Val;
  var sensor5Val;
  var sensor6Val;
  final dbRef = FirebaseDatabase.instance.reference();
  double _currentSliderValue = 20;
  final DatabaseReference db1 = FirebaseDatabase.instance.reference();
  final DatabaseReference db2 = FirebaseDatabase.instance.reference();

  var subscription;
  String status = "";
  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        setState(() {
          status = "Internet ON";
        });
      } else if (result == ConnectivityResult.mobile) {
        setState(() {
          status = "Internet ON";
        });
      } else {
        setState(() {
          status = "Internet OFF";
        });
      }
    });
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
        sensor1_Max = snapshot.value["Sensor_1"]["Max"];
        sensor1_Min = snapshot.value["Sensor_1"]["Min"];
        sensor2_Max = snapshot.value["Sensor_2"]["Max"];
        sensor2_Min = snapshot.value["Sensor_2"]["Min"];
        sensor3_Max = snapshot.value["Sensor_3"]["Max"];
        sensor3_Min = snapshot.value["Sensor_3"]["Min"];
        sensor4_Max = snapshot.value["Sensor_4"]["Max"];
        sensor4_Min = snapshot.value["Sensor_4"]["Min"];
        sensor5_Max = snapshot.value["Sensor_5"]["Max"];
        sensor5_Min = snapshot.value["Sensor_5"]["Min"];
        sensor6_Max = snapshot.value["Sensor_6"]["Max"];
        sensor6_Min = snapshot.value["Sensor_6"]["Min"];
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .child("Sensor_1")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Sensor_1 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .child("Sensor_2")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Sensor_2 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .child("Sensor_3")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Sensor_3 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .child("Sensor_4")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Sensor_4 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .child("Sensor_5")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Sensor_5 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Sensors")
        .child("names")
        .child("Sensor_6")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Sensor_6 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .child("Button_1")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Button_1 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .child("Button_2")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Button_2 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .child("Button_3")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Button_3 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .child("Button_4")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Button_4 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .child("Button_5")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Button_5 = snapshot.value;
      });
    });
    db1
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .child("names")
        .child("Button_6")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        Button_6 = snapshot.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
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
    final _kTabPages = <Widget>[
      SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("State")
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
                              snapshot.data.snapshot.value["Value"].toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              DateTime.fromMicrosecondsSinceEpoch(
                                snapshot.data.snapshot.value["Ts"] * 1000,
                              ).toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ])
                    ]);
                  } else {
                    return Column(children: [Column(children: [])]);
                  }
                }),
            const Divider(),
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("Sensors")
                    .child("MultipleData")
                    .onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    value = snapshot.data.snapshot.value["Sensor_1"];
                    sensor2Val = snapshot.data.snapshot.value["Sensor_2"];
                    sensor3Val = snapshot.data.snapshot.value["Sensor_3"];
                    sensor4Val = snapshot.data.snapshot.value["Sensor_4"];
                    sensor5Val = snapshot.data.snapshot.value["Sensor_5"];
                    sensor6Val = snapshot.data.snapshot.value["Sensor_6"];
                    if (value > sensor1_Max) {
                      sendNotification("High " + Sensor_1,
                          Sensor_1 + " is: " + value.toString());
                    } else if (value < sensor1_Min) {
                      sendNotification("Low " + Sensor_1,
                          Sensor_1 + " is: " + value.toString());
                    } else {
                      if (sensor2Val > sensor2_Max) {
                        sendNotification("High " + Sensor_2,
                            Sensor_2 + " is: " + sensor2Val.toString());
                      } else if (sensor2Val < sensor2_Min) {
                        sendNotification("Low " + Sensor_2,
                            Sensor_2 + " is: " + sensor2Val.toString());
                      } else {
                        if (sensor3Val > sensor3_Max) {
                          sendNotification("High " + Sensor_3,
                              Sensor_3 + " is: " + sensor3Val.toString());
                        } else if (sensor3Val < sensor3_Min) {
                          sendNotification("Low " + Sensor_3,
                              Sensor_3 + " is: " + sensor3Val.toString());
                        } else {
                          if (sensor4Val > sensor4_Max) {
                            sendNotification("High " + Sensor_4,
                                Sensor_4 + " is: " + sensor4Val.toString());
                          } else if (sensor4Val < sensor4_Min) {
                            sendNotification("Low " + Sensor_4,
                                Sensor_4 + " is: " + sensor4Val.toString());
                          } else {
                            if (sensor5Val > sensor5_Max) {
                              sendNotification("High " + Sensor_5,
                                  Sensor_5 + " is: " + sensor5Val.toString());
                            } else if (sensor5Val < sensor5_Min) {
                              sendNotification("Low " + Sensor_5,
                                  Sensor_5 + " is: " + sensor5Val.toString());
                            } else {
                              if (sensor6Val > sensor6_Max) {
                                sendNotification("High " + Sensor_6,
                                    Sensor_3 + " is: " + sensor6Val.toString());
                              } else if (sensor6Val < sensor6_Min) {
                                sendNotification("Low " + Sensor_6,
                                    Sensor_6 + " is: " + sensor6Val.toString());
                              } else {}
                            }
                          }
                        }
                      }
                    }

                    return Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(Sensor_1,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          color: Colors.green,
                                          height: 50,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                                snapshot.data.snapshot
                                                    .value["Sensor_1"]
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(Sensor_2,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          color: Colors.green,
                                          height: 50,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                                snapshot.data.snapshot
                                                    .value["Sensor_2"]
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(Sensor_3,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          color: Colors.green,
                                          height: 50,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                                snapshot.data.snapshot
                                                    .value["Sensor_3"]
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(Sensor_4,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          color: Colors.green,
                                          height: 50,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                                snapshot.data.snapshot
                                                    .value["Sensor_4"]
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(Sensor_5,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          color: Colors.green,
                                          height: 50,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                                snapshot.data.snapshot
                                                    .value["Sensor_5"]
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(Sensor_6,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                      color: Colors.green,
                                      height: 50,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                            snapshot
                                                .data.snapshot.value["Sensor_6"]
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                ],
                              )
                            ]),
                      ],
                    );
                  } else
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                }),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("State")
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
                              snapshot.data.snapshot.value["Value"].toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              DateTime.fromMicrosecondsSinceEpoch(
                                snapshot.data.snapshot.value["Ts"] * 1000,
                              ).toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ])
                    ]);
                  } else {
                    return Column(children: [Column(children: [])]);
                  }
                }),
            const Divider(),
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("Sensors")
                    .child("MultipleData")
                    .onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    return Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(Sensor_1,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child:
                                              SfRadialGauge(axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 100,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: sensor1_Min
                                                          .toDouble(),
                                                      color: Colors.red),
                                                  GaugeRange(
                                                      startValue: sensor1_Min
                                                          .toDouble(),
                                                      endValue: sensor1_Max
                                                          .toDouble(),
                                                      color: Colors.yellow),
                                                  GaugeRange(
                                                      startValue: sensor1_Max
                                                          .toDouble(),
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_1"]
                                                          .toDouble())
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Text(
                                                              snapshot
                                                                      .data
                                                                      .snapshot
                                                                      .value[
                                                                          "Sensor_1"]
                                                                      .toStringAsFixed(
                                                                          2) +
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(Sensor_2,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child:
                                              SfRadialGauge(axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 100,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: sensor2_Min
                                                          .toDouble(),
                                                      color: Colors.red),
                                                  GaugeRange(
                                                      startValue: sensor2_Min
                                                          .toDouble(),
                                                      endValue: sensor2_Max
                                                          .toDouble(),
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: sensor2_Max
                                                          .toDouble(),
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_2"]
                                                          .toDouble())
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Text(
                                                              snapshot
                                                                      .data
                                                                      .snapshot
                                                                      .value[
                                                                          "Sensor_2"]
                                                                      .toStringAsFixed(
                                                                          2) +
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(Sensor_3,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child:
                                              SfRadialGauge(axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 100,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: sensor3_Min
                                                          .toDouble(),
                                                      color: Colors.red),
                                                  GaugeRange(
                                                      startValue: sensor3_Min
                                                          .toDouble(),
                                                      endValue: sensor3_Max
                                                          .toDouble(),
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: sensor3_Max
                                                          .toDouble(),
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_3"]
                                                          .toDouble())
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Text(
                                                              snapshot
                                                                      .data
                                                                      .snapshot
                                                                      .value[
                                                                          "Sensor_3"]
                                                                      .toStringAsFixed(
                                                                          2) +
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(Sensor_4,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child:
                                              SfRadialGauge(axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 100,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: sensor4_Min
                                                          .toDouble(),
                                                      color: Colors.red),
                                                  GaugeRange(
                                                      startValue: sensor4_Min
                                                          .toDouble(),
                                                      endValue: sensor4_Max
                                                          .toDouble(),
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: sensor4_Max
                                                          .toDouble(),
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_4"]
                                                          .toDouble())
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Text(
                                                              snapshot
                                                                      .data
                                                                      .snapshot
                                                                      .value[
                                                                          "Sensor_4"]
                                                                      .toStringAsFixed(
                                                                          2) +
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(Sensor_5,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child:
                                              SfRadialGauge(axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 0,
                                                maximum: 100,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                      startValue: 0,
                                                      endValue: sensor5_Min
                                                          .toDouble(),
                                                      color: Colors.red),
                                                  GaugeRange(
                                                      startValue: sensor5_Min
                                                          .toDouble(),
                                                      endValue: sensor5_Max
                                                          .toDouble(),
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: sensor5_Max
                                                          .toDouble(),
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_5"]
                                                          .toDouble())
                                                ],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Text(
                                                              snapshot
                                                                      .data
                                                                      .snapshot
                                                                      .value[
                                                                          "Sensor_5"]
                                                                      .toStringAsFixed(
                                                                          2) +
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      angle: 90,
                                                      positionFactor: 0.5)
                                                ])
                                          ]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ],
                    );
                  } else
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("State")
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
                              snapshot.data.snapshot.value["Value"].toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              DateTime.fromMicrosecondsSinceEpoch(
                                snapshot.data.snapshot.value["Ts"] * 1000,
                              ).toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ])
                    ]);
                  } else {
                    return Column(children: [Column(children: [])]);
                    ;
                  }
                }),
            SizedBox(
              height: 10,
            ),
            const Divider(),
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
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
                                        child: Text(Button_1),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              onUpdate1();

                                              writData1();
                                            },
                                            label: snapshot.data.snapshot
                                                    .value["Button_1"]
                                                ? Text("ON")
                                                : Text("OFF"),
                                            elevation: 20,
                                            backgroundColor: snapshot.data
                                                    .snapshot.value["Button_1"]
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
                                        child: Text(Button_2),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              onUpdate2();

                                              writData2();
                                            },
                                            label: snapshot.data.snapshot
                                                    .value["Button_2"]
                                                ? Text("ON")
                                                : Text("OFF"),
                                            elevation: 20,
                                            backgroundColor: snapshot.data
                                                    .snapshot.value["Button_2"]
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
                                        child: Text(Button_3),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              onUpdate3();

                                              writData3();
                                            },
                                            label: snapshot.data.snapshot
                                                    .value["Button_3"]
                                                ? Text("ON")
                                                : Text("OFF"),
                                            elevation: 20,
                                            backgroundColor: snapshot.data
                                                    .snapshot.value["Button_3"]
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
                                        child: Text(Button_4),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              onUpdate4();

                                              writData4();
                                            },
                                            label: snapshot.data.snapshot
                                                    .value["Button_4"]
                                                ? Text("ON")
                                                : Text("OFF"),
                                            elevation: 20,
                                            backgroundColor: snapshot.data
                                                    .snapshot.value["Button_4"]
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
                                        child: Text(Button_5),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              onUpdate5();

                                              writData5();
                                            },
                                            label: snapshot.data.snapshot
                                                    .value["Button_5"]
                                                ? Text("ON")
                                                : Text("OFF"),
                                            elevation: 20,
                                            backgroundColor: snapshot.data
                                                    .snapshot.value["Button_5"]
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
                                        child: Text(Button_6),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton.extended(
                                            onPressed: () {
                                              onUpdate6();

                                              writData6();
                                            },
                                            label: snapshot.data.snapshot
                                                    .value["Button_6"]
                                                ? Text("ON")
                                                : Text("OFF"),
                                            elevation: 20,
                                            backgroundColor: snapshot.data
                                                    .snapshot.value["Button_6"]
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
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("State")
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
                              snapshot.data.snapshot.value["Value"].toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              DateTime.fromMicrosecondsSinceEpoch(
                                snapshot.data.snapshot.value["Ts"] * 1000,
                              ).toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ])
                    ]);
                  } else {
                    return Column(children: [Column(children: [])]);
                    ;
                  }
                }),
            SizedBox(
              height: 10,
            ),
            const Divider(),
            StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device_1")
                    .child("Live")
                    .child("Sliders")
                    .onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    return Column(children: [
                      SizedBox(height: 20),
                      Column(children: [
                        Text("Motor Position",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Center(
                          child: SfLinearGauge(
                            maximum: 360,
                            markerPointers: [
                              LinearShapePointer(
                                value: snapshot.data.snapshot.value["Slider_1"]
                                    .toDouble(),
                              ),
                            ],
                            barPointers: [
                              LinearBarPointer(
                                  value: snapshot
                                      .data.snapshot.value["Slider_1"]
                                      .toDouble())
                            ],
                          ),
                        ),
                        Text("Motor Control",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Slider(
                          value: _currentSliderValue,
                          max: 360,
                          divisions: 20,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                              dbRef
                                  .child("users")
                                  .child(uid)
                                  .child("Devices")
                                  .child("Device_1")
                                  .child("Live")
                                  .child("Sliders")
                                  .update({"Slider_1": value});
                            });
                          },
                        ),
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                    ]);
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PadButtonsView(
                    padButtonPressedCallback: padBUttonPressedCallback,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  JoystickView(
                    onDirectionChanged: onDirectionChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ];
    final _kTabs = <Tab>[
      const Tab(icon: Icon(Icons.label), text: 'Lcd'),
      const Tab(icon: Icon(Icons.access_time_filled_sharp), text: 'Gauges'),
      const Tab(icon: Icon(Icons.radio_button_off_rounded), text: 'Switch'),
      const Tab(icon: Icon(Icons.slideshow), text: 'Sliders'),
      const Tab(icon: Icon(Icons.slideshow), text: 'Joystics'),
    ];

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Device 1"),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            bottom: PreferredSize(
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabs: _kTabs,
                    ),
                    PreferredSize(
                        child: Container(
                            child: Text(status,
                                style: TextStyle(
                                    color: status == "Internet OFF"
                                        ? Color.fromARGB(255, 255, 0, 0)
                                        : Color.fromARGB(255, 0, 255, 8),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))))
                  ],
                ),
                preferredSize: Size.fromHeight(70.0)),
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
          body: TabBarView(
            children: _kTabPages,
          ),
          drawer: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("" + uname),
                accountEmail: Text("" + uemail),
              ),
              ListTile(
                leading: new IconButton(
                  icon: new Icon(Icons.home, color: Colors.white),
                  onPressed: () => null,
                ),
                title: Text('Home'),
                onTap: () {
                  print(widget.uid);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(
                            uid: this.uid,
                            uname: this.uname,
                            uemail: this.uemail)),
                  );
                },
              ),
              ListTile(
                leading: new IconButton(
                  icon: new Icon(Icons.settings, color: Colors.white),
                  onPressed: () => null,
                ),
                title: Text('Sensor Setting'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => sensorSetting(
                              uid: this.uid,
                              uname: this.uname,
                              uemail: this.uemail,
                              device: "Device_1",
                            )),
                  );
                },
              ),
              ListTile(
                leading: new IconButton(
                  icon: new Icon(Icons.settings, color: Colors.white),
                  onPressed: () => null,
                ),
                title: Text('Button Setting'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => buttonSetting(
                              uid: this.uid,
                              uname: this.uname,
                              uemail: this.uemail,
                              device: "Device_1",
                            )),
                  );
                },
              ),
              ListTile(
                leading: new IconButton(
                  icon: new Icon(Icons.settings, color: Colors.white),
                  onPressed: () => null,
                ),
                title: Text('Sensor Range Setting'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => sensorRangeSetting(
                              uid: this.uid,
                              uname: this.uname,
                              uemail: this.uemail,
                              device: "Device_1",
                            )),
                  );
                },
              ),
            ],
          ),
        ));
  }

  Future<void> writData1() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .update({"Button_1": value1});
  }

  Future<void> writData2() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .update({"Button_2": value2});
  }

  PadButtonPressedCallback padBUttonPressedCallback(
      int buttonIndex, Gestures gesture) {
    String data = "buttonIndex : ${buttonIndex}";
    print(buttonIndex);
    print(gesture);
    if (buttonIndex == 0) {
      dbRef
          .child("users")
          .child(uid)
          .child("Devices")
          .child("Device_1")
          .child("Live")
          .child("Joypads")
          .update({"Joypad_1": 0});
    } else if (buttonIndex == 1) {
      dbRef
          .child("users")
          .child(uid)
          .child("Devices")
          .child("Device_1")
          .child("Live")
          .child("Joypads")
          .update({"Joypad_1": 1});
    } else if (buttonIndex == 2) {
      dbRef
          .child("users")
          .child(uid)
          .child("Devices")
          .child("Device_1")
          .child("Live")
          .child("Joypads")
          .update({"Joypad_1": 2});
    } else if (buttonIndex == 3) {
      dbRef
          .child("users")
          .child(uid)
          .child("Devices")
          .child("Device_1")
          .child("Live")
          .child("Joypads")
          .update({"Joypad_1": 3});
    }
  }

  JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
    String data =
        "Degree : ${degrees.toStringAsFixed(2)}, distance : ${distance.toStringAsFixed(2)}";

    if (45 < degrees && degrees < 135) {
      val = 1;
    } else if (135 < degrees && degrees < 225) {
      val = 2;
    } else if (225 < degrees && degrees < 315) {
      val = 3;
    } else if (degrees == 0) {
      val = 0;
    } else {
      val = 4;
    }
    if (val != prev) {
      if (val == 0) {
        dbRef
            .child("users")
            .child(uid)
            .child("Devices")
            .child("Device_1")
            .child("Live")
            .child("Joysticks")
            .child("Joystick_1")
            .update({"angle": 0});
        print("DAtabase=" + 0.toString());
      } else if (val == 1) {
        dbRef
            .child("users")
            .child(uid)
            .child("Devices")
            .child("Device_1")
            .child("Live")
            .child("Joysticks")
            .child("Joystick_1")
            .update({"angle": 1});
        print("DAtabase=" + 1.toString());
      } else if (val == 2) {
        dbRef
            .child("users")
            .child(uid)
            .child("Devices")
            .child("Device_1")
            .child("Live")
            .child("Joysticks")
            .child("Joystick_1")
            .update({"angle": 2});
        print("DAtabase=" + 2.toString());
      } else if (val == 3) {
        dbRef
            .child("users")
            .child(uid)
            .child("Devices")
            .child("Device_1")
            .child("Live")
            .child("Joysticks")
            .child("Joystick_1")
            .update({"angle": 3});
        print("DAtabase=" + 3.toString());
      } else if (val == 4) {
        dbRef
            .child("users")
            .child(uid)
            .child("Devices")
            .child("Device_1")
            .child("Live")
            .child("Joysticks")
            .child("Joystick_1")
            .update({"angle": 4});
        print("DAtabase=" + 4.toString());
      }
      prev = val;
    }
  }

  Future<void> writData3() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .update({"Button_3": value3});
  }

  Future<void> writData4() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .update({"Button_4": value4});
  }

  Future<void> writData5() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .update({"Button_5": value5});
  }

  Future<void> writData6() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device_1")
        .child("Live")
        .child("Buttons")
        .update({"Button_6": value6});
  }
}
