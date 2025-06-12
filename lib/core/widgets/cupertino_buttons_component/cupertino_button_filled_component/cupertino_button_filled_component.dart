import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

class CupertinoButtonFilledComponent extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool useInBorderRadius;
  const CupertinoButtonFilledComponent({
    super.key,
    this.text,
    this.child,
    this.icon,
    required this.onPressed,
    this.useInBorderRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      borderRadius: useInBorderRadius
          ? BorderRadius.circular(AppConstants.inBorderRadius)
          : BorderRadius.circular(AppConstants.outBorderRadius),
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
