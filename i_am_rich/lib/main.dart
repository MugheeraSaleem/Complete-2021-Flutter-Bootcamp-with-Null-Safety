import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          backgroundColor: Colors.amber[300],
          title: Text('I am Rich'),
        ),
      ),
    ),
  );
}
