import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../constants.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class WeatherHistory {
  int temperature;
  String currentWeatherStatus;
  String cityname;
  String currentdate;
  String currenttime;

  WeatherHistory({
    required this.currentWeatherStatus,
    required this.temperature,
    required this.cityname,
    required this.currentdate,
    required this.currenttime,
  });
}

class _HistoryPageState extends State<HistoryPage> {
  final Constants _constants = Constants();
  final List<WeatherHistory> weatherHistoryList = [];
  void _clearHistory() async {
    final weatherBox = Hive.box('weatherBox');
    await weatherBox.clear();
    setState(() {
      weatherHistoryList.clear();
    });
  }

  int x = 0;

  @override
  void initState() {
    super.initState();
    _initializeHive();
    _loadWeatherHistory();
  }

  Future<void> _initializeHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.openBox('weatherBox');
  }

  Future<void> _loadWeatherHistory() async {
    final weatherBox = Hive.box('weatherBox');
    for (var i = 0; i < weatherBox.length; i++) {
      final weatherData = weatherBox.getAt(i);
      if (weatherData != null) {
        final String cityname = weatherData['name'];
        final int temperature = weatherData['temp'];
        final String currentWeatherStatus = weatherData['description'];
        final String currentdate = weatherData['date'];
        final String currenttime = weatherData['time'];

        var weatherHistory = WeatherHistory(
          cityname: cityname,
          currentWeatherStatus: currentWeatherStatus,
          temperature: temperature,
          currentdate: currentdate,
          currenttime: currenttime,
        );
        setState(() {
          weatherHistoryList.insert(0, weatherHistory);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _constants.primaryColor,
        elevation: 0,
        title: const Text('H I S T O R Y'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Swipe Right To See Menu",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: _constants.secondaryColor,
                  textColor: Colors.black);
            },
            icon: const Icon(Icons.swipe_right)),
        actions: [
          IconButton(
              onPressed: () {
                if (x == 1) {
                  _clearHistory();
                  x = 0;
                } else {
                  x += 1;
                  Fluttertoast.showToast(
                      msg: "Press Again to Clear This Page!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: _constants.secondaryColor,
                      textColor: Colors.black);
                  Timer(const Duration(seconds: 3), () {
                    if (mounted) {
                      setState(() {
                        x = 0;
                      });
                    }
                  });
                }
              },
              icon: const Icon(Icons.clear_rounded))
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('weatherBox').listenable(),
        builder: (context, box, _) {
          return ListView.builder(
            itemCount: weatherHistoryList.length,
            itemBuilder: (context, index) {
              final WeatherHistory weatherHistory = weatherHistoryList[index];
              return Card(
                color: Colors.white,
                elevation: 4,
                // //  margin: const EdgeInsets.all(10),
                shadowColor: _constants.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        weatherHistory.cityname,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Date: ${weatherHistory.currentdate.toString()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Last Update: ${weatherHistory.currenttime.toString()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Temperature: ${weatherHistory.temperature.toString()}°',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Weather Status: ${weatherHistory.currentWeatherStatus}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
