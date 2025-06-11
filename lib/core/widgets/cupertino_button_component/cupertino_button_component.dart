import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

class CupertinoButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool useInBorderRadius;
  const CupertinoButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
    required this.useInBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: useInBorderRadius
          ? BorderRadius.circular(AppConst.inBorderRadius)
          : BorderRadius.circular(AppConst.outBorderRadius),
      child: Text(text),
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
    );
  }
}
