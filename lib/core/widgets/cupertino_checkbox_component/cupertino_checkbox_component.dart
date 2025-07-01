import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';

class CupertinoCheckboxComponent extends StatelessWidget {
  const CupertinoCheckboxComponent({
    required this.value, required this.text, required this.onChanged, super.key,
  });
  final bool value;
  final String text;
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
