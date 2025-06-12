import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class CupertinoFeatureWillBeAvailableLaterDilog {
  /// Shows a Cupertino dialog that notifies user that a feature will be available
  /// later. The dialog is automatically dismissed when user taps the only
  /// available action (OK).
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
