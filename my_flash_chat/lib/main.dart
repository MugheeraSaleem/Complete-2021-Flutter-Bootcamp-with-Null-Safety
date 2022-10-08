import 'package:flutter/material.dart';
import 'package:my_flash_chat/screens/welcome_screen.dart';
import 'package:my_flash_chat/screens/login_screen.dart';
import 'package:my_flash_chat/screens/registration_screen.dart';
import 'package:my_flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.ID,
      routes: {
        WelcomeScreen.ID: (context) => WelcomeScreen(),
        RegistrationScreen.ID: (context) => RegistrationScreen(),
        LoginScreen.ID: (context) => LoginScreen(),
        ChatScreen.ID: (context) => ChatScreen()
      },
    );
  }
}
