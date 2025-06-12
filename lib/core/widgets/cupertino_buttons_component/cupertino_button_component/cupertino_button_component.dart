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
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: useInBorderRadius
          ? BorderRadius.circular(AppConstants.inBorderRadius)
          : BorderRadius.circular(AppConstants.outBorderRadius),
      padding: usePadding
          ? EdgeInsets.all(padding)
          : EdgeInsets.zero,
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      child: child ??
          (text != null
              ? Text(
                  text!,
                )
              : icon ?? const SizedBox.shrink()),
    );
  }
}
