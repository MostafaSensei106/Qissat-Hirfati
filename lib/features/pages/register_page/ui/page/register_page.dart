import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_component/cupertino_button_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';
import 'package:qissat_hirfati/features/pages/home/ui/page/home_page.dart';
import 'package:qissat_hirfati/features/pages/login_page/ui/page/login_page.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

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

  bool _showPassword = false;

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

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => HomePage()),
    );

  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tr.register),
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
            controller: _firstNameController,
            placeholder: tr.firstName,
          ),
          const SizedBox(height: 8),

          CupertinoTextFieldComponent(
            controller: _lastNameController,
            placeholder: tr.lastName,
          ),
          const SizedBox(height: 8),

          CupertinoTextFieldComponent(
            controller: _phoneController,
            placeholder: tr.phoneNumberPlaceholder,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 8),

          CupertinoTextFieldComponent(
            controller: _emailController,
            placeholder: tr.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),

          CupertinoTextFieldComponent(
            controller: _passwordController,
            placeholder: tr.password,
            obscureText: !_showPassword,
            keyboardType: TextInputType.visiblePassword,
            suffix: CupertinoButtonComponent(
              usePadding: false,
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: _showPassword
                    ? Theme.of(context).primaryColor
                    : CupertinoColors.systemGrey,
              ),
            ),
          ),
          const SizedBox(height: 8),

          CupertinoTextFieldComponent(
            controller: _confirmPasswordController,
            placeholder: tr.confirmPassword,
            obscureText: true,
          ),
          const SizedBox(height: 8),

          if (_errorText != null)
            Text(
              _errorText!,
              style: const TextStyle(color: CupertinoColors.systemRed),
            ),

          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: CupertinoButtonFilledComponent(
              onPressed: _register,
              child: Text(tr.register),
            ),
          ),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tr.alreadyHaveAccount),
              CupertinoButtonComponent(
                child: Text(tr.loginNow),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
