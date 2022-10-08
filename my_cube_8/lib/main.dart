import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Ask Me Anything'),
          ),
        ),
        body: MainPage(),
      ),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

int imagenum = 1;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  imagenum = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset('images/ball$imagenum.png'),
            ),
          ),
        ),
      ],
    );
  }
}
