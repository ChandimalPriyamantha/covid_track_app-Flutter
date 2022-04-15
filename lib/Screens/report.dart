import 'package:flutter/material.dart';
import 'welcomescreen.dart';

class Report extends StatelessWidget {
  int value;
  Report(this.value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Covid Report",
          ),
        ),
        body: CovidReport(value),
      ),
    );
  }
}

class CovidReport extends StatelessWidget {
  int ReportValue;
  CovidReport(this.ReportValue);

  String GetReport() {
    if (ReportValue > 5) {
      return 'May be , You are suffering from Covid 19.You must meet your doctor.';
    } else {
      return 'May be , You are not suffering from Covid 19. But it is better to meet your doctor, if you have some  illness.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/covid2.png'),
                fit: BoxFit.fitHeight,
              ),
              //shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(
              GetReport(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Mybutton(),
                ),
              ),
              Expanded(
                child: Center(
                  child: Mybutton_2(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
