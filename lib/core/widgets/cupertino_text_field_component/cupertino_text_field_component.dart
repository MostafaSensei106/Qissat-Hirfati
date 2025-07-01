import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';

class CupertinoTextFieldComponent extends StatelessWidget {

  const CupertinoTextFieldComponent({
    required this.placeholder, required this.controller, super.key,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.autofocus = false,
    this.enabled = true,
    this.prefix,
    this.suffix,
    this.useInBorderRadius = false,
  });
  final String placeholder;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;
  final bool useInBorderRadius;

  @override
  /// Builds a [CupertinoTextField].
  ///
  /// This widget provides a material design text field.
  ///
  /// The [controller] is used to manage the text being edited.
  ///
  /// The [placeholder] is used to display a hint until the user starts typing.
  ///
  /// The [prefix] and [suffix] are optional and can be used to add a widget
  /// before and after the text field respectively.
  ///
  /// The [keyboardType] is used to determine the type of keyboard to show.
  ///
  /// The [textInputAction] is used to determine the keyboard action button.
  ///
  /// The [inputFormatters] is used to specify formatters to be applied to the
  /// input.
  ///
  /// The [obscureText] is used to determine if the text should be obscured.
  ///
  /// The [autofocus] is used to determine if the text field should have focus
  /// when it is first built.
  ///
  /// The [enabled] is used to determine if the text field is enabled.
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      prefix: prefix,
      suffix: suffix,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      autofocus: autofocus,
      enabled: enabled,
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground,
        borderRadius: BorderRadius.circular(AppConstants.inBorderRadius),
      ),
    );
  }
}
