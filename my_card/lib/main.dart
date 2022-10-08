import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/Picture.jpeg'),
                backgroundColor: Colors.amber,
              ),
              const Text(
                'Engr. Mugheera Saleem',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'FLUTTER DEVELOPER | ML ENGINEER',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 15,
                  fontFamily: 'SSP',
                ),
              ),
              SizedBox(
                height: 15,
                width: 200,
                child: Divider(
                  thickness: 4,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+923344076565',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'mugheerasaleem29@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal,
                        fontFamily: 'SSP',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
