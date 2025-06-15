import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_feature_will_be_available_later_dilog/cupertino_feature_will_be_available_later_dilog.dart';
import 'package:qissat_hirfati/features/pages/about_app/ui/page/about_app.dart';
import 'package:qissat_hirfati/features/pages/contact/ui/page/contact_us.dart';
import 'package:qissat_hirfati/features/pages/login_page/ui/page/login_page.dart';
import 'package:qissat_hirfati/features/pages/our_history/ui/page/our_history.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.settings),
        enableBackgroundFilterBlur: true,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            spacing: 8,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGroupedBackground,
                  borderRadius: BorderRadius.circular(
                    AppConstants.inBorderRadius,
                  ),
                ),
                child: Column(
                  children: [
                    SettingsTile(
                      title: 'تسجيل الدخول',
                      subtitle: 'سجّل دخولك للوصول إلى كل الميزات',
                      icon: CupertinoIcons.person_crop_circle,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                    SettingsTile(
                      title: tr.language,
                      subtitle: tr.selectLanguage,
                      icon: CupertinoIcons.globe,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        CupertinoFeatureWillBeAvailableLaterDilog.show(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGroupedBackground,
                  borderRadius: BorderRadius.circular(
                    AppConstants.inBorderRadius,
                  ),
                ),
                child: Column(
                  children: [
                    SettingsTile(
                      title: 'نبذة عن قصة حرفتي',
                      subtitle: 'تعرف علي قصتنا',
                      icon: CupertinoIcons.info,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => AboutApp()),
                        );
                      },
                    ),
                    SettingsTile(
                      title: 'تراثنا',
                      subtitle: 'تعرف علي قصتنا',
                      icon: CupertinoIcons.book,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => OurHistory(),
                          ),
                        );
                      },
                    ),
                    SettingsTile(
                      title: 'متجرنا الالكتروني',
                      subtitle: 'اكتشف عروضنا الحصرية الآن',
                      icon: CupertinoIcons.shopping_cart,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        UrlRunServices.launchURL(AppConstants.appStroreUrl);
                      },
                    ),
                    SettingsTile(
                      title: 'تواصل معنا',
                      subtitle: 'نسعد بخدمتك في أي وقت',
                      icon: CupertinoIcons.phone,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ContactUs(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData trailingIcon;
  final VoidCallback onPressed;
  const SettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.trailingIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        HapticFeedback.vibrate();
        onPressed();
      },
      child: CupertinoListTile(
        leading: Icon(icon, size: AppConstants.iconSize),
        trailing: Icon(trailingIcon),
        subtitle: Text(subtitle),
        title: Text(title),
      ),
    );
  }
}
