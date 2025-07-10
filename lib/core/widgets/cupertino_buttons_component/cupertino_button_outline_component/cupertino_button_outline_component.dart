import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';

class CupertinoButtonOutlineComponent extends StatelessWidget {
  const CupertinoButtonOutlineComponent({
    required this.onPressed,
    super.key,
    this.text,
    this.icon,
  });
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButtonComponent(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(AppConstants.inBorderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: [
            Icon(icon, size: AppConstants.iconSize),
            Text(text ?? ''),
          ],
        ),
      ),
    );
  }
}
