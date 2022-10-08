import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent[200],
        body: Center(
          child: Image(
            image: AssetImage('images/coal.jpg'),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Center(
            child: Text('I am poor'),
          ),
        ),
      ),
    ),
  );
}
