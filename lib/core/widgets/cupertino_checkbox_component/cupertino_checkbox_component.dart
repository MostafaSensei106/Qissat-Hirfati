import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';

/// A widget that displays a [CupertinoCheckbox] and a [CupertinoButton]
/// side-by-side.
///
/// The [CupertinoCheckbox] is used to display a boolean value, and the
/// [CupertinoButton] is used to toggle this value.
class CupertinoCheckboxComponent extends StatelessWidget {
  /// Creates a [CupertinoCheckboxComponent].
  ///
  /// The [value] parameter is the boolean value to be displayed by the
  /// [CupertinoCheckbox].
  ///
  /// The [text] parameter is the text to be displayed by the
  /// [CupertinoButton].
  ///
  /// The [onChanged] parameter is a callback that is called when the value of
  /// the [CupertinoCheckbox] changes.
  const CupertinoCheckboxComponent({
    required this.value,
    required this.text,
    required this.onChanged,
    super.key,
  });

  /// The boolean value to be displayed by the [CupertinoCheckbox].
  final bool value;

  /// The text to be displayed by the [CupertinoButton].
  final String text;

  /// A callback that is called when the value of the [CupertinoCheckbox]
  /// changes.
  final ValueChanged<bool> onChanged;

  @override
  /// Build a [Row] containing a [CupertinoCheckbox] and a [CupertinoButton].
  ///
  /// The [CupertinoCheckbox] has its [CupertinoCheckbox.value] set to [value],
  /// and its [CupertinoCheckbox.onChanged] set to [onChanged].
  ///
  /// The [CupertinoButton] has its [CupertinoButton.onPressed] set to a
  /// callback that calls [onChanged] with the opposite of [value], and its
  /// [CupertinoButton.child] set to a [Text] displaying [text].
  ///
  /// When the [CupertinoCheckbox] is tapped, this widget will call
  /// [HapticFeedback.vibrate].
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoCheckbox(
          value: value,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool? value) {
            HapticFeedback.vibrate();
            onChanged(value!);
          },
        ),
        CupertinoButtonComponent(
          onPressed: () {
            onChanged(!value);
          },
          text: text,
        ),
      ],
    );
  }
}
