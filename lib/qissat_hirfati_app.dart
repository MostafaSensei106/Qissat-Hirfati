import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/config/theme/colors/light_theme.dart';
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
          Locale('en', 'US'),
          Locale('ar', 'SA'),
          Locale('fr', 'FR'),
          Locale('es', 'ES'),
          Locale('de', 'DE'),
          Locale('zh', 'CN'),
          Locale('ja', 'JP'),
          Locale('ru', 'pk'),
          ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: CupertinoColors.systemRed,
              child: SvgPicture.asset(AppConst.appLogo),
            ),
            const SizedBox(height: 40),

            CupertinoTextField(
              placeholder: tr.email,
              padding: const EdgeInsets.all(16),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            CupertinoTextField(
              placeholder: tr.password,
              padding: const EdgeInsets.all(16),
              obscureText: true,
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CupertinoCheckbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text(tr.rememberMe),
                  ],
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(tr.forgotPassword),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            CupertinoButton.filled(child: Text(tr.login), onPressed: () {}),
            const SizedBox(height: 30),

            Text(tr.orLoginWith, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.person_crop_circle),
                      const SizedBox(width: 5),
                      Text(tr.google),
                    ],
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.person_2_fill),
                      const SizedBox(width: 5),
                      Text(tr.facebook),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tr.noAccount),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(tr.registerHere),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _errorText;

  void _register() {
    final tr = AppLocalizations.of(context)!;

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorText = tr.passwordsDoNotMatch;
      });
      return;
    }

    setState(() {
      _errorText = null;
    });

    print(tr.accountCreated);
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(tr.register)),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              CupertinoTextField(
                controller: _firstNameController,
                placeholder: tr.firstName,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              CupertinoTextField(
                controller: _lastNameController,
                placeholder: tr.lastName,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              CupertinoTextField(
                controller: _phoneController,
                placeholder: tr.phoneNumberPlaceholder,
                keyboardType: TextInputType.phone,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              CupertinoTextField(
                controller: _emailController,
                placeholder: tr.email,
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              CupertinoTextField(
                controller: _passwordController,
                placeholder: tr.password,
                obscureText: true,
                padding: const EdgeInsets.all(16),
                suffix: GestureDetector(
                  onTap: () {},
                  child: const Icon(CupertinoIcons.eye),
                ),
              ),
              const SizedBox(height: 15),

              CupertinoTextField(
                controller: _confirmPasswordController,
                placeholder: tr.confirmPassword,
                obscureText: true,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 20),

              if (_errorText != null)
                Text(
                  _errorText!,
                  style: const TextStyle(color: CupertinoColors.systemRed),
                ),

              const SizedBox(height: 10),

              CupertinoButton.filled(
                onPressed: _register,
                child: Text(tr.register),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tr.alreadyHaveAccount),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(tr.loginNow),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
