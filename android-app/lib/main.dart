import 'package:flutter/material.dart';
import 'package:pe_talk/controllers/avatar_controller.dart';
import 'package:pe_talk/controllers/discussion_controller.dart';
import 'package:pe_talk/controllers/nav_controller.dart';
import 'package:pe_talk/screens/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pe_talk/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  firstTime = prefs.getBool('firstTime') ?? true;
  runApp(
    const PeTalk(),
  );
}

class PeTalk extends StatelessWidget {
  const PeTalk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavController>(
          create: (context) => NavController(),
        ),
        ChangeNotifierProvider<DiscussionController>(
          create: (context) => DiscussionController(),
        ),
        ChangeNotifierProvider<AvatarController>(
          create: (context) => AvatarController(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
          ),
          home: const StartScreen(),
        );
      },
    );
  }
}
