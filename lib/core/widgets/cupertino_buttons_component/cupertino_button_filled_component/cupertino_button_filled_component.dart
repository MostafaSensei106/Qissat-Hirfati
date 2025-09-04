import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

/// A [CupertinoButtonFilledComponent] that displays a filled button
/// with an optional text, child widget, or icon.
///
/// This widget utilizes a [CupertinoButton] styled with a filled background.
/// It provides flexibility with its content by allowing the use of a [child]
/// widget, a [text] string, or an [icon]. If all three properties are null,
/// the button will be empty.
///
/// The button's border radius is determined by [AppConstants.inBorderRadius].
/// The [onPressed] callback is required and is triggered when the button is
/// tapped.
class CupertinoButtonFilledComponent extends StatelessWidget {
  /// Creates a [CupertinoButtonFilledComponent].
  ///
  /// The [onPressed] parameter is required.
  /// The [text], [child], and [icon] parameters are optional.
  const CupertinoButtonFilledComponent({
    required this.onPressed,
    super.key,
    this.text,
    this.child,
    this.icon,
  });

  /// The text to display inside the button.
  ///
  /// If [child] is not provided, this text will be used to create a [Text]
  /// widget. Ignored if [child] or [icon] is provided.
  final String? text;

  /// A widget to display inside the button.
  ///
  /// Takes precedence over [text] and [icon] if provided.
  final Widget? child;

  /// An icon to display inside the button.
  ///
  /// Used if both [child] and [text] are null.
  final Widget? icon;

  /// The callback that is called when the button is tapped.
  ///
  /// This parameter is required and cannot be null.
  final VoidCallback onPressed;

  @override
  /// Builds the [CupertinoButton] with a filled background.
  ///
  /// The button's content is determined by the [child], [text], and [icon]
  /// properties, in that order of precedence. The button provides haptic
  /// feedback when pressed.
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      borderRadius: BorderRadius.circular(AppConstants.inBorderRadius),
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      child:
          child ??
          (text != null ? Text(text!) : icon ?? const SizedBox.shrink()),
    );
  }
}
