import 'package:flutter/cupertino.dart';
import 'package:qissat_hirfati/core/config/const/app_const.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_buttons_component/cupertino_button_filled_component/cupertino_button_filled_component.dart';
import 'package:qissat_hirfati/core/widgets/cupertino_text_field_component/cupertino_text_field_component.dart';
import 'package:qissat_hirfati/l10n/app_localizations.dart';

/// A contact form that allows the user to send a message to the support team.
///
/// The form has a name, email, and message field, and a send button.
///
/// When the form is submitted, if the form is valid, shows a dialog
/// informing the user that the message has been sent successfully, and
/// then clears all the form fields.
///
/// If the form is not valid, does nothing.
class ContactUs extends StatefulWidget {
  /// Creates a new [ContactUs] widget.
  ///
  /// The [key] parameter is optional and can be passed to identify the
  /// widget in the widget tree.
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

/// A contact form that allows the user to send a message to the support team.
///
/// The form has a name, email, and message field, and a send button.
///
/// When the form is submitted, if the form is valid, shows a dialog
/// informing the user that the message has been sent successfully, and
/// then clears all the form fields.
///
/// If the form is not valid, does nothing.
///
/// The [key] parameter is optional and can be passed to identify the
/// widget in the widget tree.
class _ContactUsState extends State<ContactUs> {
  /// A [GlobalKey] used to validate the form.
  ///
  /// This is used to validate the form when the user submits it.

  /// A [TextEditingController] used to manage the name field.
  ///
  /// This is used to store the name entered by the user.
  final TextEditingController _nameController = TextEditingController();

  /// A [TextEditingController] used to manage the email field.
  ///
  /// This is used to store the email entered by the user.
  final TextEditingController _emailController = TextEditingController();

  /// A [TextEditingController] used to manage the message field.
  ///
  /// This is used to store the message entered by the user.
  final TextEditingController _messageController = TextEditingController();

  /// Submits the contact form.
  ///
  /// If the form is valid, shows a dialog informing the user that the message
  /// has been sent successfully, and then clears all the form fields.
  ///
  /// If the form is not valid, does nothing.
  ///
  /// The [FormState] of the form is used to validate the form.
  ///
  /// The [CupertinoDialog] is used to show a dialog to the user.
  ///
  /// The [CupertinoAlertDialog] is used to create the content of the dialog.
  ///
  /// The [CupertinoDialogAction] is used to create the actions of the dialog.
  void _submitForm() {
    final tr = AppLocalizations.of(context)!;
    if (isFormValid()) {
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
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(tr.error),
          content: Text(tr.pleaseFillAllFields),
          actions: [
            CupertinoDialogAction(
              child: Text(tr.ok),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  bool isFormValid() {
    return _emailController.text.isNotEmpty &&
        _messageController.text.isNotEmpty &&
        _nameController.text.isNotEmpty;
  }

  @override
  /// Builds a contact form.
  ///
  /// The form has a name, email, and message field, and a send button.
  ///
  /// When the form is submitted, if the form is valid, shows a dialog
  /// informing the user that the message has been sent successfully, and
  /// then clears all the form fields.
  ///
  /// If the form is not valid, does nothing.
  ///
  /// The [Padding] widget is used to add padding to the form.
  ///
  /// The [Form] widget is used to create the form.
  ///
  /// The [CupertinoTextFieldComponent] widget is used to create the text
  /// fields for the name, email, and message.
  ///
  /// The [CupertinoButtonFilledComponent] widget is used to create the send
  /// button.
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(tr.contactUs)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Form(
          child: Column(
            spacing: 8,
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
  /// Disposes the [_nameController], [_emailController], and [_messageController].
  ///
  /// This is called when the widget is removed from the tree.
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
