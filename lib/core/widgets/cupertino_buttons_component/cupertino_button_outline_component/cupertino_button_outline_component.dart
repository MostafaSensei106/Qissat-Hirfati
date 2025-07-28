import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';

/// A Cupertino-style button with an outline border.
///
/// This widget is a combination of the [CupertinoButton] and [CupertinoButtonComponent]
/// widgets. It is used to create a button with a border around it.
///
/// The button is by default a rounded rectangle with a white background and a
/// black border. The border is 2.0 logical pixels wide and has a rounded corner
/// with a radius of [AppConstants.inBorderRadius].
///
/// The button contains a [Row] widget with the given [icon] and [text].
///
/// The [onPressed] callback is called when the button is tapped.
///
/// See also:
///
/// * [CupertinoButton]
/// * [CupertinoButtonComponent]
class CupertinoButtonOutlineComponent extends StatelessWidget {
  /// Creates a Cupertino-style button with an outline border.
  ///
  /// The [onPressed] callback is called when the button is tapped.
  ///
  /// The [text] and [icon] properties are used to build the child of the button.
  ///
  /// The [text] property is used to display the text of the button.
  ///
  /// The [icon] property is used to display the icon of the button.
  ///
  /// The [key] property is used to set the key of the widget.
  const CupertinoButtonOutlineComponent({
    required this.onPressed,
    super.key,
    this.text,
    this.icon,
  });

  /// The text to display on the button.
  final String? text;

  /// The icon to display on the button.
  final IconData? icon;

  /// The callback to call when the button is tapped.
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
