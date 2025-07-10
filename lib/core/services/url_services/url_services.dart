import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlRunServices {
  /// A function to launch a URL.
  ///
  /// It takes a [String] which is the URL to be launched.
  ///
  /// It will try to launch the URL with [LaunchMode.externalApplication].
  ///
  /// If the launch fails, it will throw an [Exception].
  ///
  /// If an [Exception] is thrown, it will show a toast with the error message.
  static Future<void> launchURL(String url) async {
    try {
      final uri = Uri.parse(url.trim());
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'تعذر فتح الرابط: $url';
      }
    } catch (e) {
      debugPrint('Launch URL Error: $e');
    }
  }

  /// A function to send an email.
  ///
  /// It takes a [String] for [toEmail], [subject], and [body].
  ///
  /// It will try to launch the email with [LaunchMode.externalApplication].
  ///
  /// If the launch fails, it will throw an [Exception].
  static Future<void> sendEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query:
          '${Uri.encodeQueryComponent('subject')}$subject&${Uri.encodeQueryComponent('body')}=$body',
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri); // Launch the phone call
    } else {
      throw 'Could not launch phone call';
    }
  }
}
