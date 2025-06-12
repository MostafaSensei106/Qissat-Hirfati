import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoButtonOutlineComponent extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CupertinoButtonOutlineComponent({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon), const SizedBox(width: 8.0), Text(text ?? '')],
        ),
      ),
    );
  }
}
