import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class FeatureWillBeAvailableLaterDilog extends StatelessWidget {
  const FeatureWillBeAvailableLaterDilog({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoAlertDialog(
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
    );
  }
}
