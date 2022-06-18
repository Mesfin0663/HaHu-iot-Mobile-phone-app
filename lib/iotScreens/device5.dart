import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:new_iot/home/home.dart';
import 'package:new_iot/iotScreens/settings/buttonSetting.dart';
import 'package:new_iot/iotScreens/settings/sensorSetting.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

class device5 extends StatefulWidget {
  device5({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  @override
  _device5State createState() =>
      _device5State(uid: this.uid, uname: this.uname, uemail: this.uemail);
}

class _device5State extends State<device5> {
  _device5State({this.uid, this.uname, this.uemail});
  final String uid;
  final String uname;
  final String uemail;
  String device = "Device_5";
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;

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
  final dbRef = FirebaseDatabase.instance.reference();
  double _currentSliderValue = 20;
  final DatabaseReference db1 = FirebaseDatabase.instance.reference();
  final DatabaseReference db2 = FirebaseDatabase.instance.reference();
  var subscription;
  String status = "Internet OFF";
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
        .child(device)
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
                    .child(device)
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
                    .child(device)
                    .child("Live")
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
                                                    .value["Sensor_1"]["Value"]
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
                                                    .value["Sensor_2"]["Value"]
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
                                                    .value["Sensor_3"]["Value"]
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
                                                    .value["Sensor_4"]["Value"]
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
                                                    .value["Sensor_5"]["Value"]
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
                                            snapshot.data.snapshot
                                                .value["Sensor_6"]["Value"]
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
                    .child(device)
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
                    .child(device)
                    .child("Live")
                    .child("Sensors")
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
                                                      endValue: 21,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 21,
                                                      endValue: 30,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 30,
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_1"]
                                                              ["Value"]
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
                                                                          [
                                                                          "Value"]
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
                                                      endValue: 21,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 21,
                                                      endValue: 30,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 30,
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_2"]
                                                              ["Value"]
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
                                                                          [
                                                                          "Value"]
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
                                                      endValue: 21,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 21,
                                                      endValue: 30,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 30,
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_3"]
                                                              ["Value"]
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
                                                                          [
                                                                          "Value"]
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
                                                      endValue: 21,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 21,
                                                      endValue: 30,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 30,
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_4"]
                                                              ["Value"]
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
                                                                          [
                                                                          "Value"]
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
                                                      endValue: 21,
                                                      color: Colors.green),
                                                  GaugeRange(
                                                      startValue: 21,
                                                      endValue: 30,
                                                      color: Colors.orange),
                                                  GaugeRange(
                                                      startValue: 30,
                                                      endValue: 100,
                                                      color: Colors.red)
                                                ],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: snapshot
                                                          .data
                                                          .snapshot
                                                          .value["Sensor_5"]
                                                              ["Value"]
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
                                                                          [
                                                                          "Value"]
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
                    .child(device)
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
                    .child(device)
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
                    .child(device)
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
                    .child(device)
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
                                  .child(device)
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
                      SizedBox(
                        height: 20,
                      ),
                      Row()
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
    ];
    final _kTabs = <Tab>[
      const Tab(icon: Icon(Icons.label), text: 'Lcd'),
      const Tab(icon: Icon(Icons.access_time_filled_sharp), text: 'Gauges'),
      const Tab(icon: Icon(Icons.radio_button_off_rounded), text: 'Buttons'),
      const Tab(icon: Icon(Icons.slideshow), text: 'Sliders'),
    ];

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Device 5"),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            bottom: PreferredSize(
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabs: _kTabs,
                    ),
                    // PreferredSize(
                    //     child: Container(
                    //         child: Text(status,
                    //             style: TextStyle(
                    //                 color: status == "Internet OFF"
                    //                     ? Color.fromARGB(255, 255, 0, 0)
                    //                     : Color.fromARGB(255, 0, 255, 8),
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold))))
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
                              device: "Device_5",
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
                              device: "Device_5",
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
        .child(device)
        .child("Live")
        .child("Buttons")
        .update({"Button_1": value1});
  }

  Future<void> writData2() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child(device)
        .child("Live")
        .child("Buttons")
        .update({"Button_2": value2});
  }

  Future<void> writData3() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child(device)
        .child("Live")
        .child("Buttons")
        .update({"Button_3": value3});
  }

  Future<void> writData4() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child(device)
        .child("Live")
        .child("Buttons")
        .update({"Button_4": value4});
  }

  Future<void> writData5() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child(device)
        .child("Live")
        .child("Buttons")
        .update({"Button_5": value5});
  }

  Future<void> writData6() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child(device)
        .child("Live")
        .child("Buttons")
        .update({"Button_6": value6});
  }
}
