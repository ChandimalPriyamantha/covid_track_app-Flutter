import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.text, this.colour, @required this.onPressed});
  final Color colour;
  final String text;

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300.0,
          height: 80.0,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
