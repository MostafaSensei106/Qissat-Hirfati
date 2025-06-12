import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/features/pages/settings/ui/page/settings_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.appTitle),
        enableBackgroundFilterBlur: true,
        leading: CupertinoButtonComponent(
          icon: Icon(CupertinoIcons.bars, size: AppConstants.iconSize),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoModalPopupRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ),

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Landing(),
          TextSectionCom()
          ],
        ),
      ),
    );
  }
}

class TextSectionCom extends StatelessWidget {
  const TextSectionCom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppConstants.smallTreePNG, fit: BoxFit.cover),
      ],
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [Image.asset(AppConstants.landHomeGif, fit: BoxFit.cover)],
    );
  }
}
