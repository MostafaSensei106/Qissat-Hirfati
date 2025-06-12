import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

class CupertinoButtonComponent extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool useInBorderRadius;
  final bool usePadding;
  final double padding;
  const CupertinoButtonComponent({
    super.key,
    this.text,
    required this.onPressed,
    this.useInBorderRadius = false,
    this.usePadding = false,
    this.padding = AppConstants.padding,
    this.child,
    this.icon,
  });

  @override
  /// Build a [CupertinoButton] with an optional border radius and padding.
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
  ///
  /// The [usePadding] property is used to determine whether to use the
  /// [padding] property as the padding for the button. The default value is
  /// false.
  ///
  /// The [padding] property is used as the padding for the button if
  /// [usePadding] is true. The default value is [AppConstants.padding].
  ///
  /// This method must be implemented by subclasses.
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: useInBorderRadius
          ? BorderRadius.circular(AppConstants.inBorderRadius)
          : BorderRadius.circular(AppConstants.outBorderRadius),
      padding: usePadding ? EdgeInsets.all(padding) : EdgeInsets.zero,
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
