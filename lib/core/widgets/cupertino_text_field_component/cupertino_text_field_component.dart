import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoTextFieldComponent extends StatelessWidget {
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

  const CupertinoTextFieldComponent({
    super.key,
    required this.placeholder,
    this.obscureText = false,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    required this.autofocus,
    required this.enabled,
    this.prefix,
    this.suffix,
  });

  @override
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
    );
  }
}
