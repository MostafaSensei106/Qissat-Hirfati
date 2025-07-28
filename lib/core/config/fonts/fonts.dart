/// Class for providing different text styles for the app.
///
library;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  /// A text style for the app's headline 1.
  ///
  /// The headline 1 text style is used for the app's main title and is
  /// typically displayed in a large font size.
  static TextStyle headline1(BuildContext context) => TextStyle(
    // The font size is set to 34sp which is a large font size.
    fontSize: 34.sp,
    // The font weight is set to bold which makes the text thicker and more
    // prominent.
    fontWeight: FontWeight.bold,
    // The color is set to the onPrimary color of the theme which is the
    // default color for text on the primary color.
    color: Theme.of(context).colorScheme.onPrimary,
  );

  /// A text style for the app's headline 2.
  ///
  /// The headline 2 text style is used for secondary titles and is
  /// typically displayed in a smaller font size than the headline 1.
  static TextStyle headline2(BuildContext context) => TextStyle(
    // The font size is set to 24sp which is a medium font size.
    fontSize: 24.sp,
    // The font weight is set to w600 which makes the text thicker and more
    // prominent than the normal font weight.
    // fontWeight: FontWeight.w600,
    // The color is set to the onPrimary color of the theme which is the
    // default color for text on the primary color.
    color: Theme.of(context).colorScheme.onPrimary,
  );

  /// A text style for the app's body text 1.
  ///
  /// The body text 1 text style is used for the app's main content and is
  /// typically displayed in a medium font size.
  static TextStyle bodyText1(BuildContext context) => TextStyle(
    // The font size is set to 16sp which is a medium font size.
    fontSize: 16.sp,
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onPrimary color of the theme which is the
    // default color for text on the primary color.
    color: Theme.of(context).colorScheme.onPrimary,
  );

  /// A text style for the app's body text 2.
  ///
  /// The body text 2 text style is used for secondary content and is
  /// typically displayed in a smaller font size than the body text 1.
  static TextStyle bodyText2(BuildContext context) => TextStyle(
    // The font size is set to 14sp which is a small font size.
    fontSize: 14.sp,
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onPrimary color of the theme which is the
    // default color for text on the primary color.
    color: Theme.of(context).colorScheme.onPrimary,
  );

  /// A text style for the app's button text.
  ///
  /// The button text style is used for the app's buttons and is typically
  /// displayed in a medium font size.
  static TextStyle button(BuildContext context) => TextStyle(
    // The font size is set to 16sp which is a medium font size.
    fontSize: 16.sp,
    // The font weight is set to w500 which makes the text thicker and more
    // prominent than the normal font weight.
    fontWeight: FontWeight.w500,
    // The color is set to the onPrimary color of the theme which is the
    // default color for text on the primary color.
    color: Theme.of(context).colorScheme.onPrimary,
  );

  /// A text style for the app's hint text.
  ///
  /// The hint text style is used for the app's hint text and is typically
  /// displayed in a small font size.
  static TextStyle hint(BuildContext context) => TextStyle(
    // The font size is set to 14sp which is a small font size.
    fontSize: 14.sp,
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onPrimary color of the theme with an alpha of 0x50
    // which makes the text semi-transparent.
    color: Theme.of(context).colorScheme.onPrimary.withAlpha(0x50),
  );

  /// A text style for the app's disabled text.
  ///
  /// The disabled text style is used for the app's disabled text and is
  /// typically displayed in a small font size.
  static TextStyle disabled(BuildContext context) => TextStyle(
    // The font size is set to 14sp which is a small font size.
    fontSize: 14.sp,
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onPrimary color of the theme with an alpha of 0x20
    // which makes the text semi-transparent.
    color: Theme.of(context).colorScheme.onPrimary.withAlpha(0x20),
  );

  /// A text style for the app's caption text.
  ///
  /// The caption text style is used for the app's caption text and is typically
  /// displayed in a small font size.
  static TextStyle caption(BuildContext context) => TextStyle(
    // The font size is set to 12sp which is a very small font size.
    fontSize: 12.sp,
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onPrimary color of the theme which is the
    // default color for text on the primary color.
    color: Theme.of(context).colorScheme.onPrimary,
  );

  /// A text style for the app's caption light text.
  ///
  /// The caption light text style is used for the app's caption light text and
  /// is typically displayed in a small font size.
  static TextStyle captionLight(BuildContext context) => TextStyle(
    // The font size is set to 12sp which is a very small font size.
    fontSize: 12.sp,
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onPrimary color of the theme with an alpha of 0x50
    // which makes the text semi-transparent.
    color: Theme.of(context).colorScheme.onPrimary.withAlpha(0x50),
  );

  /// A text style for the app's subtitle text.
  ///
  /// The subtitle text style is used for the app's subtitle text and is
  /// typically displayed in a small font size.
  static TextStyle subtitle(BuildContext context) => TextStyle(
    // The font weight is set to normal which makes the text normal and not
    // thicker or thinner than the default font weight.
    fontWeight: FontWeight.normal,
    // The color is set to the onSurface color of the theme with an alpha of 0x80
    // which makes the text semi-transparent.
    color: Theme.of(context).colorScheme.onSurface.withAlpha(0x80),
    // The font family is set to ArabicFont which is a custom font for the app.
    fontFamily: 'ArabicFont',
  );
}
