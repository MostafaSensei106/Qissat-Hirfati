import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class CupertinoFeatureWillBeAvailableLaterDilog {
  static Future<void> show(BuildContext context) async {
    final tr = AppLocalizations.of(context)!;
    await showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(tr.info),
        content: Text(tr.featureWillBeAvailableLater),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.of(context).pop();
            },
            child: Text(tr.ok),
          ),
        ],
      ),
    );
  }
}
