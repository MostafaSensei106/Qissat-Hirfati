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

/// A stateless widget that builds the About App page which provides information
/// about the application.
///
/// The page includes a navigation bar with a title, a background image with a
/// description text overlaid, and multiple sections describing the app's
/// goals, vision, and message. Each section is displayed in a column layout
/// within a scrollable view.
class AboutApp extends StatelessWidget {
  /// Default constructor for the [AboutApp] widget.
  const AboutApp({super.key});

  @override
  /// Builds the About App page which provides information about the application.
  ///
  /// The page includes a navigation bar with a title, a background image with a
  /// description text overlaid, and multiple sections describing the app's
  /// goals, vision, and message. Each section is displayed in a column layout
  /// within a scrollable view.
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      /// The navigation bar shows the title and provides a back button to
      /// return to the home page.
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.infoAboutUs),
        enableBackgroundFilterBlur: true,
      ),

      /// The main content of the page is a scrollable view containing a
      /// background image with a description text overlaid, and multiple
      /// sections describing the app's goals, vision, and message.
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// The background image with a description text overlaid.
            Stack(
              alignment: Alignment.center,
              children: [
                /// The background image is a PNG asset loaded from the
                /// project's assets directory.
                Image.asset(
                  AppConstants.handPNG,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),

                /// The description text is displayed centered and bold.
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

            /// The section describing the app's goals.
            ArticleSectionComponent(
              title: tr.ourGoals,
              description: tr.ourGoals_description,
              useButton: false,
              color: AppConstants.primarySectionColor,
              onPressed: () {},
            ),

            /// The section describing the app's vision.
            ArticleSectionComponent(
              title: tr.ourVision,
              description: tr.ourVision_description,
              onPressed: () {},
            ),

            /// The section describing the app's message.
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
