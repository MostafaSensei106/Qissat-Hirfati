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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final PageController pageController = PageController();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.appTitle),
        enableBackgroundFilterBlur: true,
        leading: CupertinoButtonComponent(
          icon: Icon(CupertinoIcons.bars, size: AppConstants.iconSize),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoSheetRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const Landing(),
            const OverviewSection(),
            ArticleSectionComponent(
              title: tr.heritage,
              useChild: true,
              useButton: true,
              onPressed: () {
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
                      UrlRunServices.launchURL(AppConstants.mohammedbinSalmanAlSaudLink);
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
                      child: Image.asset(AppConstants.mohammedbinSalmanAlSaudPNG),
                    ),
                  ),
                ],
              ),
            ),
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
                        Image.asset(AppConstants.trs2PNG, filterQuality: FilterQuality.high),
                        Image.asset(AppConstants.trsPNG, filterQuality: FilterQuality.high, fit: BoxFit.cover),
                        Image.asset(AppConstants.trs3PNG, filterQuality: FilterQuality.high, fit: BoxFit.cover),
                        Image.asset(AppConstants.trs4PNG, filterQuality: FilterQuality.high, fit: BoxFit.contain),
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
  final String title;
  final String? description;
  final bool useChild;
  final bool useButton;
  final Widget? child;
  final Color? color;
  final VoidCallback onPressed;

  const ArticleSectionComponent({
    super.key,
    required this.title,
    this.description,
    this.child,
    this.useChild = false,
    this.useButton = false,
    this.color,
    required this.onPressed,
  });

  @override
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

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(AppConstants.padding),
          color: AppConstants.primarySectionColor,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr.creativeHands, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              SizedBox(
                width: 0.90.sw,
                child: Text(tr.overviewDescription, style: const TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 35),
              CupertinoButtonFilledComponent(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const AboutApp()),
                  );
                },
                text: tr.aboutQissatHirfati,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            AppConstants.smallTreePNG,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            opacity: const AlwaysStoppedAnimation(.5),
          ),
        ),
      ],
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppConstants.landHomeGif,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Text(
          tr.creativeSaudiHands,
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
