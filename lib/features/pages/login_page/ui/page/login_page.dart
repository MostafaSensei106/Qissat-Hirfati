import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_outline_component/cupertino_button_outline_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_checkbox_component/cupertino_checkbox_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';
import 'package:qissat_hirfati/core/widgets/app_divider/app_divider.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_feature_will_be_available_later_dilog/cupertino_feature_will_be_available_later_dilog.dart';
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
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.login),
        enableBackgroundFilterBlur: true,
      ),
      child: ListView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
        semanticChildCount: 8,
        children: [
          Image.asset(AppConstants.appLogoPng, width: 150.w, height: 150.h),
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
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: showPassword
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 12),
          buildLoginRow(tr, context),
          const SizedBox(height: 12),
          buildLoginButton(context, tr),
          const SizedBox(height: 32),
          LoginOption(tr: tr),
          const SizedBox(height: 32),
          SocialMediaLoginForm(tr: tr),
          const SizedBox(height: 10),
          registrationRow(tr, context),
        ],
      ),
    );
  }

  Row buildLoginRow(AppLocalizations tr, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
            CupertinoFeatureWillBeAvailableLaterDilog.show(context);
          },
          text: tr.forgotPassword,
        ),
      ],
    );
  }

  SizedBox buildLoginButton(BuildContext context, AppLocalizations tr) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButtonFilledComponent(
        onPressed: () {
          CupertinoFeatureWillBeAvailableLaterDilog.show(context);
        },
        text: tr.login,
      ),
    );
  }

  Row registrationRow(AppLocalizations tr, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(tr.noAccount),
        const SizedBox(width: 8),
        CupertinoButtonComponent(
          text: tr.registerHere,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (context) => RegisterPage()),
            );
          },
        ),
      ],
    );
  }
}

class SocialMediaLoginForm extends StatelessWidget {
  const SocialMediaLoginForm({super.key, required this.tr});

  final AppLocalizations tr;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CupertinoButtonOutlineComponent(
          onPressed: () {
            CupertinoFeatureWillBeAvailableLaterDilog.show(context);
          },
          text: tr.loginWithGoogle,
          icon: CupertinoIcons.game_controller_solid,
        ),
        CupertinoButtonOutlineComponent(
          onPressed: () {
            CupertinoFeatureWillBeAvailableLaterDilog.show(context);
          },
          text: tr.loginWithFacebook,
          icon: CupertinoIcons.flag_circle,
        ),
      ],
    );
  }
}

class LoginOption extends StatelessWidget {
  const LoginOption({super.key, required this.tr});

  final AppLocalizations tr;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppDivider()),
        Text(tr.orLoginWith, style: const TextStyle(fontSize: 14)),
        Expanded(child: AppDivider()),
      ],
    );
  }
}
