import 'package:flutter/material.dart';
import 'homepage.dart';
import 'covidtracking.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage('images/covid.png'),
          fit: BoxFit.fitHeight,
        ),
        //shape: BoxShape.circle,
      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Quizzler()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Start Checking',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        height: 80.0,
        width: 300.0,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.0),
          color: Colors.green,
        ),
      ),
    );
  }
}

class WelcomeMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Text(
        'Welcome to Covid Checking and Tracking System',
        style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
      ),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class Mybutton_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tracking()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Start Tracking',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        height: 80.0,
        width: 300.0,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.0),
          color: Colors.green,
        ),
      ),
    );
  }
}
