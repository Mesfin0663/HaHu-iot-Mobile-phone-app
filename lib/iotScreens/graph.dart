import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(Chart());
}

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LiveChart());
  }
}

class LiveChart extends StatefulWidget {
  LiveChart({this.uid});
  final String uid;
  @override
  _LiveChartState createState() => _LiveChartState(uid: this.uid);
}

class _LiveChartState extends State<LiveChart> {
  _LiveChartState({this.uid});
  final String uid;
  Timer timer;
  int count = 0;
  List<_ChartData> chartData = <_ChartData>[];
  Map<dynamic, dynamic> data;

  void _updateDataSource(Timer timer) {
    setState(() {
      chartData.add(_ChartData(
          x: DateTime.fromMillisecondsSinceEpoch(data['x']), y1: data['y1']));
      // if(chartData.length >= 20){
      //   chartData.removeAt(0);
      // }
    });

    count = count + 1;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _showChart());
  }

  Widget _showChart() {
    return StreamBuilder(
        stream: FirebaseDatabase()
            .reference()
            .child("users")
                      .child(uid)
                      .child("Devices")
                      .child("Device_1")
                      .child("")
                      .onValue,
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            List<dynamic> values = snapshot.data.snapshot.value;
            if (values != null && count < values.length) {
              // for (int index = 0; index < values.length; index++) {
              data = values[count];
              timer = Timer.periodic(
                  Duration(milliseconds: 3000), _updateDataSource);
              // }
            }

            widget = Container(
              child: SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: DateTimeAxis(),
                  series: <LineSeries<_ChartData, DateTime>>[
                    LineSeries<_ChartData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y1)
                  ]),
            );
          } else {
            widget = Center(child: CircularProgressIndicator());
          }

          return widget;
        });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}

class _ChartData {
  _ChartData({this.x, this.y1});
  final DateTime x;
  final int y1;
}
