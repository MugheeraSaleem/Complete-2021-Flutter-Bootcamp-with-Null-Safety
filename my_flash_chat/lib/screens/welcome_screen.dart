import 'package:flutter/material.dart';
import 'package:my_flash_chat/screens/login_screen.dart';
import 'package:my_flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_flash_chat/custombutton.dart';

class WelcomeScreen extends StatefulWidget {
  static String ID = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'animation',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomButton(
                colour: Colors.lightBlueAccent,
                onpressed: () {
                  Navigator.pushNamed(
                      context, LoginScreen.ID); //Go to registration screen.
                },
                buttonname: 'Log In'),
            CustomButton(
                colour: Colors.blueAccent,
                onpressed: () {
                  Navigator.pushNamed(context,
                      RegistrationScreen.ID); //Go to registration screen.
                },
                buttonname: 'Register'),
          ],
        ),
      ),
    );
  }
}
