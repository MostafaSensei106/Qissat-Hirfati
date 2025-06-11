import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';
import 'package:qissat_hirfati/qissat_hirfati_app.dart';

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

            //CupertinoTextFieldComponent(placeholder: tr.phoneNumberPlaceholder,),

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