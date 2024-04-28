//import 'package:dialga_productivity_app/bluetooth_input.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  String connectedText = 'Connect to CarpelCare';
  String messageReceived = '';
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  @override
  void initState() {
    chartData = getChartData();
    print("Does this work?");
    //Timer.periodic(const Duration(milliseconds: 200), updateDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: Text(connectedText),
            onPressed: _connectToBluetooth,
          ),
          Text(messageReceived),
          Center(
            child: Container(
              height: 300, // Adjust the height as needed
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust the width as needed
              child: SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    color: const Color.fromRGBO(192, 108, 132, 1),
                    xValueMapper: (LiveData sales, _) => sales.time,
                    yValueMapper: (LiveData sales, _) => sales.speed,
                  )
                ],
                primaryXAxis: const NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    interval: 3,
                    title: AxisTitle(text: 'Data Instance')),
                primaryYAxis: const NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    minimum: 0,
                    maximum: 120,
                    majorTickLines: const MajorTickLines(size: 0),
                    title: AxisTitle(text: 'Wrist Angle (Degrees)')),
              ),
            ),
          )
        ],
      ),
    );
  }

  String receivedData = '';
  void onDataReceived(Uint8List data) {
    String dataString = utf8.decode(data);
    receivedData += dataString;
    if (receivedData.contains('\n')) {
      // Entire value received
      String value = receivedData.trim(); // Remove leading/trailing whitespace
      // Process the received value
      print('Received value: $value');
      setState(() {
        messageReceived = '${value}';
      });
      int val = int.parse(messageReceived);
      avg += val;
      chartData.add(LiveData(time++, (val)));
      chartData.removeAt(0);
      _chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1, removedDataIndex: 0);
      // Reset receivedData for next value
      receivedData = '';
    }
  }

  void _connectToBluetooth() async {
    String address = "20:18:08:34:FA:47"; // Replace with your HC-05 address
    try {
      BluetoothConnection _connection =
          await BluetoothConnection.toAddress(address);
      print('Connected to the device');
      setState(() {
        connectedText = "Disconnect";
      });
      _connection.input!.listen((Uint8List data) {
        print('Output: ${ascii.decode(data)}');
        _connection.output.add(data);
        // Sending data
        onDataReceived(data);

        if (ascii.decode(data).contains('#')) {
          _connection.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });
    } catch (exception) {
      print(exception);
    }
  }

  int time = 19;
  int avg = 0;

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94)
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
