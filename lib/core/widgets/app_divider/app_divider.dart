import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  /// Returns a horizontal divider with a thickness of 1 and a color of
  /// [Colors.grey]. The divider will be indented by 16 logical pixels from the
  /// start and end of the screen.
  ///
  /// See also:
  ///
  /// * [Divider], the widget used to build the divider.
  ///
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
