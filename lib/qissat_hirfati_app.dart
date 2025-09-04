import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/theme/colors/light_theme.dart';
import 'package:qissat_hirfati/core/locals/logic/cubit/local_cubit.dart'
    show LocaleCubit;
import 'package:qissat_hirfati/features/pages/login_page/ui/page/login_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class QissatHirfatiApp extends StatelessWidget {
  const QissatHirfatiApp({super.key});

  @override
  /// The main widget of the application.
  ///
  /// The widget is a [ScreenUtilInit] which is used to initialize the screen
  /// size and font size scaling.
  ///
  /// The [BlocBuilder] is used to listen to the [LocaleCubit] and get the
  /// current locale.
  ///
  /// The [CupertinoApp] is the root widget of the application. It is used to
  /// configure the app's theme, home page, and locale.
  ///
  /// The [CupertinoApp] also includes a [SafeArea] widget to ensure that the
  /// app's content is not obscured by the notch or other screen features.
  ///
  /// The [localizationsDelegates] is used to configure the app's supported
  /// locales and the [localeListResolutionCallback] is used to determine the
  /// app's locale based on the user's device settings.
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Qissat Hirfati',
            theme: lightTheme,
            home: LoginPage(),
            locale: locale,
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
            builder: (context, child) {
              return SafeArea(
                top: false,
                bottom: true,
                left: false,
                right: false,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
