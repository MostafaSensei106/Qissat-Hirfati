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
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: () {
          HapticFeedback.vibrate();
          onPressed();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.0,
            children: [Icon(icon), Text(text ?? '')],
          ),
        ),
      ),
    );
  }
}
