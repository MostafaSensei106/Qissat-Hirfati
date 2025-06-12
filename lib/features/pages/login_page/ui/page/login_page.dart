import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_checkbox_component/cupertino_checkbox_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';
import 'package:qissat_hirfati/core/widgets/feature_will_be_available_later_dilog/feature_will_be_available_later_dilog.dart';
import 'package:qissat_hirfati/features/pages/register_page/ui/page/register_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(tr.login)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding.w),
        child: Column(
          children: [
            Image.asset(AppConstants.appLogoPng, width: 120.w, height: 120.h),
            const SizedBox(height: 8),

            CupertinoTextFieldComponent(
              placeholder: tr.email,
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 8),

            CupertinoTextFieldComponent(
              placeholder: tr.password,
              controller: widget.passwordController,
              obscureText: !showPassword,
              keyboardType: TextInputType.visiblePassword,
              suffix: CupertinoButtonComponent(
                usePadding: false,
                onPressed: () {
                  HapticFeedback.vibrate();
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                useInBorderRadius: true,
                child: Icon(
                  showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: showPassword
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoCheckboxComponent(
                  value: rememberMe,
                  text: tr.rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),

                CupertinoButtonComponent(
                  onPressed: () {
                    FeatureWillBeAvailableLaterDilog();
                  },
                  text: tr.forgotPassword,
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
