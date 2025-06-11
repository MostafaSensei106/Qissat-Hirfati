

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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