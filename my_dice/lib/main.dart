import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Center(
            child: Text(
              'Lets Dice',
            ),
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

int leftnumber = 1;
int rightnumber = 1;
var total = 2;

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftnumber = Random().nextInt(6) + 1;
                        rightnumber = Random().nextInt(6) + 1;
                        total = leftnumber + rightnumber;
                      });
                    },
                    child: Image.asset('images/dice$leftnumber.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          leftnumber = Random().nextInt(6) + 1;
                          rightnumber = Random().nextInt(6) + 1;
                          total = leftnumber + rightnumber;
                        },
                      );
                      ;
                    },
                    child: Image.asset('images/dice$rightnumber.png'),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 30,
            width: 70,
            color: Colors.white,
            child: Center(
              child: Text(
                '$total',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
