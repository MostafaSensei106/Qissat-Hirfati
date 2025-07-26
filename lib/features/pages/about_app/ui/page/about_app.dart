// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        TextStyle,
        Text,
        CupertinoNavigationBar,
        Alignment,
        Image,
        BoxFit,
        TextAlign,
        FontWeight,
        CupertinoColors,
        Stack,
        Column,
        SingleChildScrollView,
        CupertinoPageScaffold;
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/features/pages/home/ui/page/home_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart'
    show AppLocalizations;

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  /// Builds the About App page which provides information about the application.
  ///
  /// The page includes a navigation bar with a title, a background image with
  /// a description text overlaid, and multiple sections describing the app's
  /// goals, vision, and message. Each section is displayed in a column layout
  /// within a scrollable view.
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.infoAboutUs),
        enableBackgroundFilterBlur: true,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppConstants.handPNG,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Text(
                  tr.aboutUs_description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
              ],
            ),
            ArticleSectionComponent(
              title: tr.ourGoals,
              description: tr.ourGoals_description,
              useButton: false,
              color: AppConstants.primarySectionColor,
              onPressed: () {},
            ),
            ArticleSectionComponent(
              title: tr.ourVision,
              description: tr.ourVision_description,
              onPressed: () {},
            ),
            ArticleSectionComponent(
              title: tr.ourMessage,
              description: tr.ourMessage_description,
              onPressed: () {},
              color: AppConstants.primarySectionColor,
            ),
          ],
        ),
      ),
    );
  }
}
