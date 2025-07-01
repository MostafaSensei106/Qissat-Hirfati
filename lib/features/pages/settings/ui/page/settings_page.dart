import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/locals/logic/cubit/local_cubit.dart'
    show LocaleCubit;
import 'package:qissat_hirfati/core/services/url_services/url_services.dart';
import 'package:qissat_hirfati/features/pages/about_app/ui/page/about_app.dart';
import 'package:qissat_hirfati/features/pages/contact/ui/page/contact_us.dart';
import 'package:qissat_hirfati/features/pages/login_page/ui/page/login_page.dart';
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
                      title: tr.login,
                      subtitle: tr.loginSuptitle,
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
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ChangeLocals(),
                          ),
                        );
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
                      title: tr.infoAboutQissatHirfati,
                      subtitle: tr.infoAboutQissatHirfatiSuptitle,
                      icon: CupertinoIcons.info,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => const AboutApp()),
                        );
                      },
                    ),
                    SettingsTile(
                      title: tr.ourHistory,
                      subtitle: tr.ourHistorySuptitle,
                      icon: CupertinoIcons.book,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => OurHistory(),
                        //   ),
                        // );
                      },
                    ),
                    SettingsTile(
                      title: tr.ourOnLineStore,
                      subtitle: tr.ourOnLineStoreSuptitle,
                      icon: CupertinoIcons.shopping_cart,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        UrlRunServices.launchURL(AppConstants.appStroreUrl);
                      },
                    ),
                    SettingsTile(
                      title: tr.contactUs,
                      subtitle: tr.contactUsSuptitle,
                      icon: CupertinoIcons.phone,
                      trailingIcon: CupertinoIcons.forward,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => const ContactUs()),
                        );
                      },
                    ),

                    const SizedBox(height: 8),
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
  const SettingsTile({
    required this.title, required this.subtitle, required this.icon, required this.trailingIcon, required this.onPressed, super.key,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData trailingIcon;
  final VoidCallback onPressed;

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

class ChangeLocals extends StatelessWidget {
  const ChangeLocals({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final localeCubit = context.watch<LocaleCubit>();

    final locales = <String, Locale>{
      'العربية': const Locale('ar', 'SA'),
      'English': const Locale('en', 'US'),
      'Français': const Locale('fr', 'FR'),
      'Español': const Locale('es', 'ES'),
      'Deutsch': const Locale('de', 'DE'),
      '中文': const Locale('zh', 'CN'),
      '日本語': const Locale('ja', 'JP'),
      'Русский': const Locale('ru', 'RU'),
    };

    return CupertinoPageScaffold(
      navigationBar:  CupertinoNavigationBar(middle: Text(tr.changeLanguage)),
      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
        children: locales.entries.map((entry) {
          final selected = localeCubit.state == entry.value;
          return CupertinoListTile(
            //leading: const Icon(CupertinoIcons.globe),
            title: Text(entry.key, style: const TextStyle(fontSize: 16)),
            subtitle: Text(entry.value.countryCode!),
            trailing: selected
                ? Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Theme.of(context).primaryColor,
                  )
                : null,
            onTap: () => {
              HapticFeedback.vibrate(),
              localeCubit.changeLocale(entry.value),
            },
          );
        }).toList(),
      ),
    );
  }
}
