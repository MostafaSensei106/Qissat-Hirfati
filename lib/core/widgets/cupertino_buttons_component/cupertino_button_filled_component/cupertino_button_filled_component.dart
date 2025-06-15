import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

class CupertinoButtonFilledComponent extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Widget? icon;
  final VoidCallback onPressed;
  //final bool useInBorderRadius;
  const CupertinoButtonFilledComponent({
    super.key,
    this.text,
    this.child,
    this.icon,
    required this.onPressed,
    //this.useInBorderRadius = false,
  });

  @override
  /// Build a [CupertinoButton] with a filled background and an optional border
  /// radius.
  ///
  /// The [child] property can be used to pass a widget to be used as the button
  /// child. If [child] is null, the [text] property is used to generate a
  /// [Text] widget. If both [child] and [text] are null, the [icon] property is
  /// used to generate an [Icon] widget. If all three properties are null,
  /// an empty [SizedBox] is used.
  ///
  /// The [onPressed] property is required and is the callback that will be
  /// called when the button is tapped.
  ///
  /// The [useInBorderRadius] property is used to determine whether to use the
  /// [AppConstants.inBorderRadius] value for the border radius, or the
  /// [AppConstants.outBorderRadius] value. The default value is false.
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
