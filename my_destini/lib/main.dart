import 'package:flutter/material.dart';
import 'storybrains.dart';

void main() {
  runApp(const Destini());
}

StoryBrain storyBrain = StoryBrain();

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: storypage(),
    );
  }
}

class storypage extends StatefulWidget {
  const storypage({Key? key}) : super(key: key);

  @override
  State<storypage> createState() => _storypageState();
}

class _storypageState extends State<storypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new Text(
                        storyBrain.getStory(),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: Text(
                        storyBrain.getChoice1(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Visibility(
                      visible: storyBrain.buttonShouldBeVisible(),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Text(
                          storyBrain.getChoice2(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
