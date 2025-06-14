import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
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
              CupertinoModalPopupRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ),

      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Landing(),
            OverviewSection(),
            ArticleSectionComponent(
              title: 'تراثنا',
              useChild: true,
              useButton: true,
              description:
                  'التراث السعودي هو لوحة فنية تمتزج فيها أصالة الماضي بعراقة الحضارات القديمة التي ازدهرت على هذه الأرض. من شمال المملكة إلى جنوبها، ومن شرقها إلى غربها، تزخر السعودية بمواقع تاريخية وأثرية تحكي قصص أجيال مضت وتركت بصمتها في صفحات التاريخ.',
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(height: 8),
                  AppDivider(),
                  Text(
                    'يُعد البشت رمز للفخامة والهوية السعودية، يزين القادة والملوك في المناسبات الرسمية، ويجسده ولي العهد الأمير محمد بن سلمان بأسلوب يجمع بين الأصالة والتحديث. لمعرفة قصته، اضغط على البشت في الصورة.',
                  ),
                  SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppConstants.outBorderRadius,
                    ),
                    child: Image.asset(AppConstants.mohammedbinSalmanAlSaudPNG),
                  ),
                ],
              ),
            ),

            ArticleSectionComponent(
              useChild: true,
              title: 'اعمالنا',
              description:
                  'نصمم منتجات تنبض بعراقة التراث المتجذر في هويتنا، نستلهم منها ملامح الحاضر ونرسم بها ملامح المستقبل',
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(width: 0.5.sw, child: AppDivider()),
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
                            Text('Qissat Hirfati'),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.treesPNG),
                            Text('Mohammed bin Salman Al Saud'),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.pathPNG),
                            Text('Small Tree'),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Image.asset(AppConstants.lampPNG),
                            Text('Qissat Hirfati'),
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
  final String description;
  final bool useChild;
  final bool useButton;
  final Widget? child;
  final Color? color;

  const ArticleSectionComponent({
    super.key,
    required this.title,
    required this.description,
    this.child,
    this.useChild = false,
    this.useButton = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
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
            Text(description),
            const SizedBox(height: 8),
            useButton
                ? CupertinoButtonFilledComponent(
                    onPressed: () {},
                    text: 'تعرف على المزيد',
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(AppConstants.padding),
          color: AppConstants.primarySectionColor,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أيادٍ سعودية مبدعة،\nتنسج المستقبل بلمسات مستوحاة من التراث وعراقة الأصالة.',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 0.90.sw,
                child: Text(
                  'نسعى للارتقاء بمستقبل الحرف اليدوية السعودية، لتقديم إبداعات عصرية تنبض بروح التراث الأصيل.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 35),
              CupertinoButtonFilledComponent(
                onPressed: () {},
                text: 'نبذة عن قصة حرفتي',
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppConstants.landHomeGif,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Text(
          'أيدٍ سعودية مبدعة.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}
