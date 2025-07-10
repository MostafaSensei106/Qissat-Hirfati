import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

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
    final tr = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(tr.sentSuccessfully),
          content: Text(tr.thankYouForContactingUs),
          actions: [
            CupertinoDialogAction(
              child: Text(tr.ok),
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
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(tr.contactUs)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CupertinoTextFieldComponent(
                controller: _nameController,
                placeholder: tr.fullName,
                // validator: (value) =>
                //     value == null || value.isEmpty ? tr.enterYourName : null,
              ),
              CupertinoTextFieldComponent(
                controller: _emailController,
                placeholder: tr.email,
                keyboardType: TextInputType.emailAddress,
                // validator: (value) =>
                //     value == null || value.isEmpty ? tr.enterYourEmail : null,
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _messageController,
                placeholder: tr.yourMessage,
                maxLines: 5,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(
                    AppConstants.inBorderRadius,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: CupertinoButtonFilledComponent(
                  onPressed: _submitForm,
                  text: tr.send,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
