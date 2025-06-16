import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/theme/colors/light_theme.dart';
import 'package:qissat_hirfati/features/pages/login_page/ui/page/login_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class QissatHirfatiApp extends StatelessWidget {
  const QissatHirfatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Qissat Hirfati',
        theme: lightTheme,
        home: LoginPage(),
        locale: const Locale('ar', 'SA'),
        supportedLocales: const [
          Locale('ar', 'SA'), // Arabic

          Locale('en', 'US'), // English
          Locale('fr', 'FR'), // French
          Locale('es', 'ES'), // Spanish
          Locale('de', 'DE'), // German
          Locale('zh', 'CN'), // Chinese
          Locale('ja', 'JP'), // Japanese
          Locale('ru', 'RU'), // Russian
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        localeListResolutionCallback: (locales, supportedLocales) =>
            locales?.firstWhere(
              (locale) => supportedLocales.contains(locale),
              orElse: () => const Locale('ar', 'SA'),
            ),
        // builder: (context, child) {
        //   return SafeArea(
        //     top: false,
        //     bottom: true,
        //     left: false,
        //     right: false,
        //     child: child!,
        //   );
        // },
      ),
    );
  }
}
