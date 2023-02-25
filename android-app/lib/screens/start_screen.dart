import 'package:flutter/material.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/screens/signup_screen.dart';
import 'package:pe_talk/widgets/pe_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            getImage('welcome'),
          ),
          const Text(
            'Lets Find Together Your\nFriend with us',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          PeButton(
            width: 200.0,
            height: 50.0,
            label: 'Get Started',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              );
            },
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
