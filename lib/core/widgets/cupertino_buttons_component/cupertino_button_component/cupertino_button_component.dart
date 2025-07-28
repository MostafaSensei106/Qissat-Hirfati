import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

/// A customizable Cupertino-style button component.
///
/// The [CupertinoButtonComponent] provides a flexible button widget that can
/// display text, an icon, or a custom child widget. It offers options for
/// handling padding and includes haptic feedback on press.
///
/// This class extends [StatelessWidget], making it immutable and allowing
/// its properties to be set only once.
///
/// Example usage:
/// ```dart
/// CupertinoButtonComponent(
///   onPressed: () {
///     print('Button pressed');
///   },
///   text: 'Press Me',
///   usePadding: true,
/// )
/// ```
class CupertinoButtonComponent extends StatelessWidget {
  /// Creates a [CupertinoButtonComponent].
  ///
  /// The [onPressed] callback is required and will be triggered when the
  /// button is tapped.
  ///
  /// The [text], [child], [icon], [usePadding], and [padding] parameters are
  /// optional and provide additional customization.
  const CupertinoButtonComponent({
    required this.onPressed,
    super.key,
    this.text,
    this.usePadding = false,
    this.padding = AppConstants.padding,
    this.child,
    this.icon,
  });

  /// Optional text to display inside the button.
  ///
  /// If [child] is null and [text] is provided, a [Text] widget will be
  /// created using this value.
  final String? text;

  /// Optional custom widget to display inside the button.
  ///
  /// If provided, this widget will take precedence over [text] and [icon].
  final Widget? child;

  /// Optional icon to display inside the button.
  ///
  /// Used if both [text] and [child] are null. If all three properties are
  /// null, an empty [SizedBox] is used.
  final Widget? icon;

  /// Callback function triggered when the button is tapped.
  ///
  /// This is a required parameter and must not be null.
  final VoidCallback onPressed;

  /// Determines if the button should have padding.
  ///
  /// Defaults to false, meaning no padding by default.
  final bool usePadding;

  /// Padding value to apply to the button when [usePadding] is true.
  ///
  /// Defaults to [AppConstants.padding].
  final double padding;

  /// Builds the Cupertino button widget.
  ///
  /// The button will display the [child] widget if provided. Otherwise, it
  /// will display a [Text] widget with [text] or an [Icon] widget with [icon].
  /// If all are null, the button will be an empty [SizedBox].
  ///
  /// The [onPressed] callback is called when the button is tapped, and
  /// [HapticFeedback.vibrate] is called to provide tactile feedback.
  @override
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
