import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

void playmusic(int note) {
  final player = AudioPlayer();
  player.play(AssetSource('note$note.wav'));
}

Expanded BuildKey({required Color color, required int number}) {
  return Expanded(
    child: Container(
      color: color,
      child: MaterialButton(
        onPressed: () {
          playmusic(number);
        },
      ),
    ),
  );
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BuildKey(color: Colors.red, number: 1),
              BuildKey(color: Colors.orange, number: 2),
              BuildKey(color: Colors.yellow, number: 3),
              BuildKey(color: Colors.green, number: 4),
              BuildKey(color: Colors.blue, number: 5),
              BuildKey(color: Colors.indigo, number: 6),
              BuildKey(color: Colors.purple, number: 7),
            ],
          ),
        ),
      ),
    );
  }
}
