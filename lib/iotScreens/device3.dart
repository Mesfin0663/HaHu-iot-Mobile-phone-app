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
          title: Text("Device 1"),
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
          child: StreamBuilder(
              stream: dbRef
                  .child("users")
                  .child(uid)
                  .child("Devices")
                  .child("Device1")
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
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                snapshot.data.snapshot.value["state"]
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: Colors.green,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Temperature",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            snapshot.data.snapshot
                                                .value["Temperature"]
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Humidity",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new Row(
                                          children: [
                                            new Container(
                                              child: Text(
                                                  snapshot.data.snapshot
                                                      .value["Humidity"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            new Container(
                                              child: Text("%",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            color: Colors.teal,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Remote Mode"),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton.extended(
                                      onPressed: () {
                                        onUpdate();

                                        writData();
                                      },
                                      label:
                                          snapshot.data.snapshot.value["switch"]
                                              ? Text("ON")
                                              : Text("OFF"),
                                      elevation: 20,
                                      backgroundColor:
                                          snapshot.data.snapshot.value["switch"]
                                              ? Colors.yellow
                                              : Colors.red,
                                      icon:
                                          snapshot.data.snapshot.value["switch"]
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
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            color: Colors.teal,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Water Pump"),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton.extended(
                                      onPressed: () {
                                        onUpdate1();

                                        writData1();
                                      },
                                      label: snapshot
                                              .data.snapshot.value["switch1"]
                                          ? Text("ON")
                                          : Text("OFF"),
                                      elevation: 20,
                                      backgroundColor: snapshot
                                              .data.snapshot.value["switch1"]
                                          ? Colors.white
                                          : Colors.pink,
                                      icon: snapshot
                                              .data.snapshot.value["switch1"]
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Motor Position",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Center(
                          child: Container(
                        child: SfLinearGauge(
                          maximum: 360,
                          markerPointers: [
                            LinearShapePointer(
                              value: snapshot.data.snapshot.value["motor"]
                                  .toDouble(),
                            ),
                          ],
                          barPointers: [
                            LinearBarPointer(
                                value: snapshot.data.snapshot.value["motor"]
                                    .toDouble())
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Motor Control",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Slider(
                        value: _currentSliderValue,
                        max: 360,
                        divisions: 5,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                            dbRef
                                .child("users")
                                .child(uid)
                                .child("Devices")
                                .child("Device1")
                                .child("Live")
                                .update({"motor": value});
                          });
                        },
                      ),
                    ],
                  );
                } else
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
              }),
        ));
  }

  Future<void> writData() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device1")
        .child("Live")
        .update({"switch": value});
  }

  Future<void> writData1() {
    dbRef
        .child("users")
        .child(uid)
        .child("Devices")
        .child("Device1")
        .child("Live")
        .update({"switch1": value1});
  }
}
