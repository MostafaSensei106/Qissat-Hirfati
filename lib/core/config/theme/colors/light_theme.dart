import 'package:flutter/cupertino.dart';

const CupertinoThemeData lightTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF9D653B),
  barBackgroundColor: Color(0xFFFFFFFF),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  applyThemeToAll: true,

  textTheme: CupertinoTextThemeData(
    primaryColor: Color(0xFF9D653B),
    textStyle: TextStyle(
      color: Color(0xFF333333),
      fontSize: 16,
      fontFamily: 'Rubik',
    ),
    navTitleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
      fontFamily: 'Rubik',
    ),
    navLargeTitleTextStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
      fontFamily: 'Rubik',
    ),
    actionTextStyle: TextStyle(
      color: Color(0xFF9D653B),
      fontSize: 16,
      fontFamily: 'Rubik',
    ),
  ),
);
