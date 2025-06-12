import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.settings),
        enableBackgroundFilterBlur: true,
      ),
      child: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}