import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('تم الإرسال'),
          content: const Text('شكرًا لتواصلك معنا!'),
          actions: [
            CupertinoDialogAction(
              child: const Text('حسنًا'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('تواصل معنا')),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 8,
            children: [
              CupertinoTextFieldComponent(
                controller: _nameController,
                placeholder: 'الاسم الكامل',
                // validator: (value) =>
                //     value == null || value.isEmpty ? 'أدخل الاسم' : null,
              ),
              CupertinoTextFieldComponent(
                controller: _emailController,
                placeholder: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              CupertinoTextField(
                controller: _messageController,
                placeholder: 'رسالتك',
                maxLines: 5,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(
                    AppConstants.inBorderRadius,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CupertinoButtonFilledComponent(
                  onPressed: _submitForm,
                  text: 'ارسال',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
