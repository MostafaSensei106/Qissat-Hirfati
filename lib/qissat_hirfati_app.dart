import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QissatHirfatiApp extends StatelessWidget {
  const QissatHirfatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      locale: Locale('ar', 'SA'),
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
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FlutterLogo(size: 100),
            const SizedBox(height: 40),

            // البريد الإلكتروني
            const CupertinoTextField(
              placeholder: 'البريد الإلكتروني',
              padding: EdgeInsets.all(16),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // كلمة المرور
            const CupertinoTextField(
              placeholder: 'كلمة المرور',
              padding: EdgeInsets.all(16),
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // تذكرني + نسيت كلمة المرور
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
                    const Text("تذكرني"),
                  ],
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text("نسيت كلمة المرور؟"),
                  onPressed: () {
                    // منطق الاستعادة
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // زر تسجيل الدخول
            CupertinoButton.filled(
              child: const Text('تسجيل الدخول'),
              onPressed: () {
                // منطق تسجيل الدخول
              },
            ),
            const SizedBox(height: 30),

            // تسجيل الدخول بوسائل تواصل
            const Text("أو سجل الدخول عبر", style: TextStyle(fontSize: 14)),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: const [
                      Icon(CupertinoIcons.person_crop_circle),
                      SizedBox(width: 5),
                      Text("Google"),
                    ],
                  ),
                  onPressed: () {
                    // تسجيل دخول بـ Google
                  },
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: const [
                      Icon(CupertinoIcons.person_2_fill),
                      SizedBox(width: 5),
                      Text("Facebook"),
                    ],
                  ),
                  onPressed: () {
                    // تسجيل دخول بـ Facebook
                  },
                ),
              ],
            ),
            const Spacer(),

            // ليس لديك حساب؟ سجل هنا
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ليس لديك حساب؟ "),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text("سجل هنا"),
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
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorText = 'كلمتا المرور غير متطابقتين';
      });
      return;
    }

    // تنفيذ منطق التسجيل هنا
    setState(() {
      _errorText = null;
    });

    print("تم تسجيل الحساب ✅");
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("تسجيل حساب")),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // الاسم الأول
              CupertinoTextField(
                controller: _firstNameController,
                placeholder: 'الاسم الأول',
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              // اسم العائلة
              CupertinoTextField(
                controller: _lastNameController,
                placeholder: 'اسم العائلة',
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              // رقم الجوال
              CupertinoTextField(
                controller: _phoneController,
                placeholder: 'رقم الجوال السعودي (+966...)',
                keyboardType: TextInputType.phone,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              // البريد الإلكتروني
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 15),

              // كلمة المرور
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'كلمة المرور',
                obscureText: true,
                padding: const EdgeInsets.all(16),
                suffix: GestureDetector(
                  onTap: () {
                    // Logic to toggle password visibility
                  },
                  child: Icon(CupertinoIcons.eye),
                ),
              ),
              const SizedBox(height: 15),

              // تأكيد كلمة المرور
              CupertinoTextField(
                controller: _confirmPasswordController,
                placeholder: 'تأكيد كلمة المرور',
                obscureText: true,
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 20),

              // خطأ
              if (_errorText != null)
                Text(
                  _errorText!,
                  style: const TextStyle(color: CupertinoColors.systemRed),
                ),

              const SizedBox(height: 10),

              // زر تسجيل حساب
              CupertinoButton.filled(
                onPressed: _register,
                child: const Text("تسجيل حساب"),
              ),

              const SizedBox(height: 30),

              // هل لديك حساب؟
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("هل لديك حساب؟ "),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text("سجّل دخولك"),
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
