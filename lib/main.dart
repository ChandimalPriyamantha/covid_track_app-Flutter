import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/welcomescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Covid C&T",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: WelcomeScreen(),
              ),
            ),
            Expanded(
              child: WelcomeMsg(),
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
        ),
      ),
    );
  }
}
