import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.colour,
      required this.onpressed,
      required this.buttonname});

  late final Color colour;
  late final VoidCallback? onpressed;
  late final String buttonname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonname,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
