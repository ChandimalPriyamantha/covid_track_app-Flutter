import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Covid Tracking",
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: CovidTracking(),
          ),
        ),
      ),
    );
  }
}

class CovidTracking extends StatefulWidget {
  @override
  State<CovidTracking> createState() => _CovidTrackingState();
}

class _CovidTrackingState extends State<CovidTracking> {
  String localNca = '00';
  String updateDate = '0000-00-00';
  String localTca = '00';
  String localNdeth = '00';

  void getData() async {
    http.Response response = await http.get(
        Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      try {
        setState(() {
          updateDate = decodedData['data']['update_date_time'];
          int localNc = decodedData['data']['local_new_cases'];
          localNca = localNc.toString();
          int localTc = decodedData['data']['local_total_cases'];
          localTca = localTc.toString();
          int localNd = decodedData['data']['local_new_deaths'];
          localNdeth = localNd.toString();
        });
      } catch (e) {
        //print(e);
      }

      // print("update_date_time:-$updateDate");
      // //
      // print(decodedData['data']
      //     ['local_total_number_of_individuals_in_hospitals']);
      // print(decodedData['data']['local_deaths']);

      //print(decodedData);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            width: double.infinity,
            height: 200.00,
            child: Card(
              child: Column(
                children: [
                  Icon(Icons.calendar_today, size: 50, color: Colors.blue),
                  Text(
                    'Update Date Time',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    updateDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Sri Lanka',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              color: Colors.green,
              elevation: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            width: double.infinity,
            height: 200.00,
            child: Card(
              color: Colors.purple,
              child: Column(
                children: [
                  Icon(Icons.bloodtype_rounded, size: 50, color: Colors.red),
                  Text(
                    'Local New Cases',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    localNca,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              elevation: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            width: double.infinity,
            height: 200.00,
            child: Card(
              color: Colors.blue,
              child: Column(
                children: [
                  Icon(Icons.bloodtype_rounded, size: 50, color: Colors.red),
                  Text(
                    'Local Total Cases',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    localTca,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              elevation: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            width: double.infinity,
            height: 200.00,
            child: Card(
              color: Colors.orange,
              child: Column(
                children: [
                  Icon(Icons.bloodtype_rounded, size: 50, color: Colors.red),
                  Text(
                    'Local New Deaths',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    localNdeth,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              elevation: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
