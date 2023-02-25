import 'package:flutter/material.dart';
import 'package:pe_talk/constants.dart';
import 'package:pe_talk/screens/nav_screen.dart';
import 'package:pe_talk/widgets/input_text.dart';
import 'package:pe_talk/widgets/pe_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              height: 350.0,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      PeInput(
                        hintText: 'Email',
                        textColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PeInput(
                        hintText: 'Password',
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  PeButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    width: 200.0,
                    height: 50.0,
                    label: 'Sign up',
                    onPressed: () {
                      while (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
