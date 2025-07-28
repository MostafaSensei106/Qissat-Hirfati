import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

/// Shows a Cupertino dialog that notifies user that a feature will be available
/// later. The dialog is automatically dismissed when user taps the only
/// available action (OK).
///
/// The dialog is displayed using [showCupertinoDialog] and is automatically
/// dismissed when user taps the only available action (OK).
///
/// The dialog displays a title and a content message. The title is "Info" and the
/// content is "This feature will be available later".
///
/// The dialog has a single action button labeled "OK". The button is rendered
/// using [CupertinoDialogAction].
///
/// The [show] method is a static method that can be called from any widget.
/// It takes a [BuildContext] as a single argument.
///
/// The method returns a [Future] that resolves when the dialog is dismissed.
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
