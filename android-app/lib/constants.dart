import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getIcon(String icon) => 'assets/icons/$icon.svg';
String getImage(String image) => 'assets/images/$image.png';

const Color mainClr = Color(0xFFFFD600),
    red = Colors.red, //Color(0xFFB49866);
    whitish = Color.fromRGBO(49, 66, 186, 0.03137254901960784),
    greyish = Color(0xFFD9D9D9),
    grey = Color(0xFF828282),
    green = Colors.green,
    white = Colors.white,
    blue = Colors.blue;

late SharedPreferences prefs;
late bool firstTime;
