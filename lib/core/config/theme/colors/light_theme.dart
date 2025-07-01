import 'package:flutter/cupertino.dart';

final CupertinoThemeData lightTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF9D653B),
  barBackgroundColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  applyThemeToAll: true,

  textTheme: CupertinoTextThemeData(
    primaryColor: const Color(0xFF9D653B),
    textStyle: TextStyle(
      color: const Color(0xFF333333),
      fontSize: 16,
      fontFamily: 'Rubik',
    ),
    navTitleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF333333),
      fontFamily: 'Rubik',
    ),
    navLargeTitleTextStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF333333),
      fontFamily: 'Rubik',
    ),
    actionTextStyle: TextStyle(
      color: const Color(0xFF9D653B),
      fontSize: 16,
      fontFamily: 'Rubik',
    ),
  ),
);
