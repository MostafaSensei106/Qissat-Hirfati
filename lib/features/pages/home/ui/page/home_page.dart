import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
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
        physics: const ScrollPhysics(),
        child: Column(
          children: [Landing(), TextSectionCom()],
        ),
      ),
    );
  }
}

class TextSectionCom extends StatelessWidget {
  const TextSectionCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(AppConstants.padding),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أيادٍ سعودية مبدعة،\nتنسج المستقبل بلمسات مستوحاة من التراث وعراقة الأصالة.',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 0.90.sw,
                child: Text(
                  'نسعى للارتقاء بمستقبل الحرف اليدوية السعودية، لتقديم إبداعات عصرية تنبض بروح التراث الأصيل.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 35),
              CupertinoButtonFilledComponent(onPressed: () {}, text: 'استكشف المزيد', ),
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
      children: [Image.asset(AppConstants.landHomeGif, fit: BoxFit.cover ,),
        Text(
          'أيدٍ سعودية مبدعة.',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold ,color: CupertinoColors.white),
        ),
      ],
    );
  }
}
