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

/// A widget that represents the registration page of the application.
///
/// The registration page includes input fields for the user's first name,
/// last name, phone number, email, and password. The user must also confirm
/// their password. The page also includes buttons for registering and logging
/// in.
///
/// The page is built with a [CupertinoPageScaffold] and a [ListView] to
/// organize its content.
///
/// The [build] method is the main entry point for building the page. It
/// creates the widgets and layouts the page according to the application's
/// design.
///
/// The page's state is managed by the [_RegisterPageState] class.
class RegisterPage extends StatefulWidget {
  /// Creates a new [RegisterPage].
  ///
  /// The [key] argument is used to identify this widget in the widget tree.
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

/// A stateful widget that represents the registration page of the application.
///
/// The registration page includes input fields for the user's first name,
/// last name, phone number, email, and password. The user must also confirm
/// their password. The page also includes buttons for registering and logging
/// in.
///
/// The page is built with a [CupertinoPageScaffold] and a [ListView] to
/// organize its content.
///
/// The [build] method is the main entry point for building the page. It
/// creates the widgets and layouts the page according to the application's
/// design.
///
/// The page's state is managed by the [_RegisterPageState] class.
class _RegisterPageState extends State<RegisterPage> {
  /// A [TextEditingController] that manages the first name input field.
  final _firstNameController = TextEditingController();

  /// A [TextEditingController] that manages the last name input field.
  final _lastNameController = TextEditingController();

  /// A [TextEditingController] that manages the phone number input field.
  final _phoneController = TextEditingController();

  /// A [TextEditingController] that manages the email input field.
  final _emailController = TextEditingController();

  /// A [TextEditingController] that manages the password input field.
  final _passwordController = TextEditingController();

  /// A [TextEditingController] that manages the confirm password input field.
  final _confirmPasswordController = TextEditingController();

  /// A boolean that determines whether the password and confirm password input
  /// fields are obscured or not.
  bool _showPassword = false;

  /// An error message that is displayed if the password and confirm password
  /// are not the same.
  String? _errorText;

  /// Handles the registration process.
  ///
  /// Checks if the password and confirm password are the same, and if not,
  /// shows an error message. If the passwords are the same, it navigates to
  /// the home page.
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
      CupertinoPageRoute(builder: (context) => const HomePage()),
    );
  }

  /// Disposes of the [TextEditingController]s when the widget is disposed.
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

  /// The main entry point for building the page.
  ///
  /// Creates the widgets and layouts the page according to the application's
  /// design.
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
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
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
            obscureText: !_showPassword,
            keyboardType: TextInputType.visiblePassword,
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
