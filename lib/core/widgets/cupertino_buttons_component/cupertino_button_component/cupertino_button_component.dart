import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

class CupertinoButtonComponent extends StatelessWidget {
  const CupertinoButtonComponent({
    required this.onPressed, super.key,
    this.text,
    this.usePadding = false,
    this.padding = AppConstants.padding,
    this.child,
    this.icon,
  });
  final String? text;
  final Widget? child;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool usePadding;
  final double padding;

  @override
  /// Builds a [CupertinoButton] with the given [text], [child], and [icon].
  ///
  /// The [onPressed] callback is called when the button is tapped, and
  /// [HapticFeedback.vibrate] is called after that.
  ///
  /// The [usePadding] property is used to determine if the button should have
  /// padding.
  ///
  /// The [padding] property is used to set the padding of the button if
  /// [usePadding] is true.
  ///
  /// The button will use the [child] widget if it is not null. If [child] is
  /// null, the button will use a [Text] widget with the given [text] value if
  /// [text] is not null. If both [text] and [child] are null, the button will
  /// use an [Icon] widget with the given [icon] value. If all three properties
  /// are null, an empty [SizedBox] is used.
  Widget build(BuildContext context) {
    return CupertinoButton(
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
