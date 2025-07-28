import 'package:flutter/cupertino.dart';

/// The theme used by the app in light mode.
///
/// This theme is used as the default theme by the app and is used in the
/// `MaterialApp` widget.
///
/// The theme uses a light background color and a dark text color.
///
/// The theme also sets the font family to [Rubik] which is a sans-serif font.
///
/// The theme also sets the font size to 16 and the font weight to normal.
///
/// The theme also sets the text color to [Color(0xFF333333)] which is a dark
/// grey color.
///
/// The theme also sets the primary color to [Color(0xFF9D653B)] which is a
/// light orange color.
///
/// The theme also sets the background color of the [CupertinoNavigationBar]
/// to [Color(0xFFFFFFFF)] which is a white color.
///
/// The theme also sets the background color of the [CupertinoPage] to
/// [Color(0xFFFFFFFF)] which is a white color.
///
/// The theme also sets the applyThemeToAll property to true which means that
/// the theme will be applied to all the widgets in the app.
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
