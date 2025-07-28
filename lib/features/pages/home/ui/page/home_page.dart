import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_feature_will_be_available_later_dilog/cupertino_feature_will_be_available_later_dilog.dart';
import 'package:qissat_hirfati/features/pages/about_app/ui/page/about_app.dart';
import 'package:qissat_hirfati/features/pages/our_history/ui/page/our_history.dart';
import 'package:qissat_hirfati/features/pages/settings/ui/page/settings_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// A stateless widget that represents the home page of the application.
///
/// This widget builds the main user interface for the home page, which includes:
/// - A navigation bar with a title and a button to navigate to the settings page.
/// - A scrollable page containing several article sections and interactive elements.
/// - An introduction section, a heritage section with a clickable image, and a work section with a horizontally scrollable image gallery.
/// - Smooth page indicators and buttons for interaction and navigation.
///
/// The layout uses a column within a scroll view to organize its content.
class HomePage extends StatelessWidget {
  /// Constructs a constant instance of [HomePage].
  const HomePage({super.key});

  /// Builds the home page widget tree.
  ///
  /// This method returns a [CupertinoPageScaffold] widget that contains:
  /// - A [CupertinoNavigationBar] with a title and a button to navigate to the settings page.
  /// - A [SingleChildScrollView] that contains a [Column] with various sections and interactive elements.
  ///
  /// The [CupertinoNavigationBar] uses a leading [CupertinoButtonComponent] to navigate to the [SettingsPage].
  /// The main content is arranged in a column with multiple [ArticleSectionComponent] widgets.
  ///
  /// [BuildContext] is the context in which the widget is built.
  @override
  Widget build(BuildContext context) {
    // Localized text instance for the current build context.
    final tr = AppLocalizations.of(context)!;

    // Controller for managing the horizontal scrolling of the PageView.
    final pageController = PageController();

    return CupertinoPageScaffold(
      // Navigation bar with the app title and a button to open settings.
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.appTitle),
        enableBackgroundFilterBlur: true,
        leading: CupertinoButtonComponent(
          icon: const Icon(CupertinoIcons.bars, size: AppConstants.iconSize),
          onPressed: () {
            // Navigate to the SettingsPage when the button is pressed.
            Navigator.push(
              context,
              CupertinoSheetRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ),
      // Main content of the home page within a scroll view.
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            // Introduction section at the top of the page.
            const Landing(),

            // Overview section providing a brief description of the app.
            const OverviewSection(),

            // Heritage section with a description and clickable image.
            ArticleSectionComponent(
              title: tr.heritage,
              useChild: true,
              useButton: true,
              onPressed: () {
                // Navigate to the OurHistory page when pressed.
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const OurHistory()),
                );
              },
              description: tr.heritage_description,
              child: Column(
                spacing: 8,
                children: [
                  const SizedBox(height: 8),
                  const AppDivider(),
                  Text(tr.bisht_description),
                  const SizedBox(height: 4),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // Launch URL when the image is clicked.
                      UrlRunServices.launchURL(
                        AppConstants.mohammedbinSalmanAlSaudLink,
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.darkBackgroundGray,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        AppConstants.mohammedbinSalmanAlSaudPNG,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Work section with horizontally scrollable image gallery.
            ArticleSectionComponent(
              title: tr.ourWork,
              useChild: true,
              useButton: false,
              onPressed: () {},
              color: AppConstants.primarySectionColor,
              description: tr.ourWork_description,
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(width: 0.5.sw, child: const AppDivider()),
                  SizedBox(
                    height: 280,
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.greenOrbPNG),
                            const Text('Qissat Hirfati'),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.treesPNG),
                            const Text('Mohammed bin Salman Al Saud'),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.pathPNG),
                            const Text('Small Tree'),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.lampPNG),
                            const Text('Qissat Hirfati'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CupertinoButtonFilledComponent(
                    onPressed: () {
                      // Show dialog when the button is pressed.
                      CupertinoFeatureWillBeAvailableLaterDilog.show(context);
                    },
                    child: Text(tr.more),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Text(
                        tr.successPartners,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Expanded(child: AppDivider()),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: PageView(
                      children: [
                        Image.asset(
                          AppConstants.trs2PNG,
                          filterQuality: FilterQuality.high,
                        ),
                        Image.asset(
                          AppConstants.trsPNG,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          AppConstants.trs3PNG,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          AppConstants.trs4PNG,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleSectionComponent extends StatelessWidget {
  const ArticleSectionComponent({
    required this.title,
    required this.onPressed,
    super.key,
    this.description,
    this.child,
    this.useChild = false,
    this.useButton = false,
    this.color,
  });
  final String title;
  final String? description;
  final bool useChild;
  final bool useButton;
  final Widget? child;
  final Color? color;
  final VoidCallback onPressed;

  @override
  /// Build a [Container] with a [Column] containing:
  ///
  /// - a [Row] with a bold [Text] of [title] and an [AppDivider]
  /// - an optional [Text] with the given [description]
  /// - an optional [CupertinoButtonFilledComponent] with the text
  ///   [AppLocalizations.seeMore]
  /// - the given [child] widget if [useChild] is true
  ///
  /// The [color] property is used to set the background color of the
  /// [Container]. If [color] is null, the default color is
  /// [CupertinoColors.white].
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Container(
      color: color ?? CupertinoColors.white,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Expanded(child: AppDivider()),
              ],
            ),
            if (description != null) Text(description!),
            const SizedBox(height: 8),
            useButton
                ? CupertinoButtonFilledComponent(
                    onPressed: () {
                      HapticFeedback.vibrate();
                      onPressed();
                    },
                    text: tr.seeMore,
                  )
                : const SizedBox.shrink(),
            if (useChild && child != null) child!,
          ],
        ),
      ),
    );
  }
}

/// A stateless widget that represents the overview section of the home page.
///
/// This section displays a themed background with an image and description text.
/// It includes a button that navigates to the About App page when pressed.
class OverviewSection extends StatelessWidget {
  /// Creates an instance of [OverviewSection].
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Localization instance for accessing localized strings.
    final tr = AppLocalizations.of(context)!;

    return Stack(
      // Allows children to overflow the stack's bounds.
      clipBehavior: Clip.none,
      children: [
        // Main container holding the content of the overview section.
        Container(
          // Padding around the content inside the container.
          padding: const EdgeInsets.all(AppConstants.padding),
          // Background color of the section.
          color: AppConstants.primarySectionColor,
          // Expand the container to fill the available width.
          width: double.infinity,
          child: Column(
            // Align children to the start of the column.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title text of the overview section.
              Text(tr.creativeHands, style: const TextStyle(fontSize: 20)),
              // Spacer between title and description.
              const SizedBox(height: 16),
              // Description text of the overview section.
              SizedBox(
                // Width of the description text container.
                width: 0.90.sw,
                child: Text(
                  tr.overviewDescription,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              // Spacer between description and button.
              const SizedBox(height: 35),
              // Button to navigate to the About App page.
              CupertinoButtonFilledComponent(
                onPressed: () {
                  // Navigate to the About App page on button press.
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const AboutApp()),
                  );
                },
                text: tr.aboutQissatHirfati,
              ),
              // Spacer below the button.
              const SizedBox(height: 16),
            ],
          ),
        ),
        // Positioned image for decorative purposes.
        Positioned(
          // Align image to the left, top and bottom of the stack.
          left: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            // Image asset path.
            AppConstants.smallTreePNG,
            // Fit image within its bounds while maintaining aspect ratio.
            fit: BoxFit.contain,
            // Quality of image rendering.
            filterQuality: FilterQuality.high,
            // Opacity level of the image.
            opacity: const AlwaysStoppedAnimation(.5),
          ),
        ),
      ],
    );
  }
}

/// A widget that displays a landing page with a GIF background and a centered
/// bold white text.
///
/// The GIF background is a creative representation of the Saudi hands which
/// are the core of the application. The text displayed is a message that
/// welcomes the user and tells them that the application is an initiative
/// by the Saudi government to promote the local handicrafts and provide
/// a platform for the artisans to showcase their work.
///
/// The text is centered horizontally and vertically within the stack.
/// The image is fit to cover the entire screen and the width is set to
/// infinity to ensure that it takes up the entire width of the screen.
class Landing extends StatelessWidget {
  /// Creates a new [Landing] widget.
  ///
  /// The [key] parameter is optional and can be used to identify the widget.
  const Landing({super.key});

  @override
  /// Builds the [Landing] widget.
  ///
  /// The method returns a [Stack] widget with two children:
  /// 1. An [Image] widget that displays the GIF background.
  /// 2. A [Text] widget that displays the welcome message.
  ///
  /// The [Stack] widget is used to position the text at the center of the
  /// screen, both horizontally and vertically.
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return Stack(
      // Set the alignment of the stack to center.
      alignment: Alignment.center,
      // The stack has two children: an image and a text.
      children: [
        // The image is the GIF background.
        Image.asset(
          // The path to the GIF asset.
          AppConstants.landHomeGif,
          // Fit the image to cover the entire screen.
          fit: BoxFit.cover,
          // Set the width of the image to infinity to ensure it takes up
          // the entire width of the screen.
          width: double.infinity,
        ),
        // The text is a welcome message.
        Text(
          // The text to display.
          tr.creativeSaudiHands,
          // The style of the text: bold, white, and font size 16.
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}
