import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:new_iot/home/home.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
  bool value = false;
  bool value1 = false;
  double _currentSliderValue;
  final dbRef = FirebaseDatabase.instance.reference();

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  onUpdate1() {
    setState(() {
      value1 = !value1;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text("Device 2"),
            actions: [
              IconButton(
                icon: Icon(Icons.home),
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
            ]),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: StreamBuilder(
                stream: dbRef
                    .child("users")
                    .child(uid)
                    .child("Devices")
                    .child("Device2")
                    .child("Live")
                    .onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Connection",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  snapshot.data.snapshot.value["state"]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Temperature",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                height: 300,
                                width: 300,
                                child: SfRadialGauge(axes: <RadialAxis>[
                                  RadialAxis(minimum: 0, maximum: 100, ranges: <
                                      GaugeRange>[
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
                                  ], pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: snapshot
                                            .data.snapshot.value["Temperature"]
                                            .toDouble())
                                  ], annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        widget: Container(
                                            child: Text(
                                                snapshot.data.snapshot
                                                        .value["Temperature"]
                                                        .toString() +
                                                    "°",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        angle: 90,
                                        positionFactor: 0.5)
                                  ])
                                ]),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Humidity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                height: 300,
                                width: 300,
                                child: SfRadialGauge(axes: <RadialAxis>[
                                  RadialAxis(
                                      minimum: 0,
                                      maximum: 100,
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                            startValue: 0,
                                            endValue: 25,
                                            color: Colors.green),
                                        GaugeRange(
                                            startValue: 25,
                                            endValue: 75,
                                            color: Colors.orange),
                                        GaugeRange(
                                            startValue: 75,
                                            endValue: 100,
                                            color: Colors.red)
                                      ],
                                      pointers: <GaugePointer>[
                                        NeedlePointer(
                                            value: snapshot
                                                .data.snapshot.value["Humidity"]
                                                .toDouble())
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                            widget: Container(
                                                child: Text(
                                                    snapshot.data.snapshot
                                                            .value["Humidity"]
                                                            .toString() +
                                                        "%",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            angle: 90,
                                            positionFactor: 0.8)
                                      ])
                                ]),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            FloatingActionButton.extended(
                              onPressed: () {
                                onUpdate();

                                writData();
                              },
                              label: snapshot.data.snapshot.value["switch"]
                                  ? Text("ON")
                                  : Text("OFF"),
                              elevation: 20,
                              backgroundColor:
                                  snapshot.data.snapshot.value["switch"]
                                      ? Colors.yellow
                                      : Colors.red,
                              icon: snapshot.data.snapshot.value["switch"]
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                onUpdate1();

                                writData1();
                              },
                              label: snapshot.data.snapshot.value["switch1"]
                                  ? Text("ON")
                                  : Text("OFF"),
                              elevation: 20,
                              backgroundColor:
                                  snapshot.data.snapshot.value["switch1"]
                                      ? Colors.white
                                      : Colors.pink,
                              icon: snapshot.data.snapshot.value["switch1"]
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else
                    return Container(
                        child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Connecting.......',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ));
                })));
  }

  Future<void> writData() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device2")
        .child("Live")
        .update({"switch": value});
  }

  Future<void> writData1() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device2")
        .child("Live")
        .update({"switch1": value1});
  }
}
