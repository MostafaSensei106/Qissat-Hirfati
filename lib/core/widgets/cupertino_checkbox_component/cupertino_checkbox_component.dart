import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';

class CupertinoCheckboxComponent extends StatelessWidget {
  const CupertinoCheckboxComponent({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
  });
  final bool value;
  final String text;
  final ValueChanged<bool> onChanged;

  @override
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
