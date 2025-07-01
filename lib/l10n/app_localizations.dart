import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('ru'),
    Locale('ur'),
    Locale('zh'),
  ];

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @orLoginWith.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get orLoginWith;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// No description provided for @signUpHere.
  ///
  /// In en, this message translates to:
  /// **'Sign up here'**
  String get signUpHere;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerTitle;

  /// No description provided for @registerHere.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get registerHere;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// No description provided for @phoneNumberPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneNumberPlaceholder;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Saudi Mobile Number (+966...)'**
  String get phoneNumber;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account?'**
  String get haveAccount;

  /// No description provided for @loginNow.
  ///
  /// In en, this message translates to:
  /// **'Login now'**
  String get loginNow;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @loginWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Login with Facebook'**
  String get loginWithFacebook;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error, please check your connection'**
  String get networkError;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @korean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get korean;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @ourOnLineStore.
  ///
  /// In en, this message translates to:
  /// **'Our Online Store'**
  String get ourOnLineStore;

  /// No description provided for @ourOnLineStoreSuptitle.
  ///
  /// In en, this message translates to:
  /// **'Discover our exclusive offers now'**
  String get ourOnLineStoreSuptitle;

  /// No description provided for @loginSuptitle.
  ///
  /// In en, this message translates to:
  /// **'Login to access all features'**
  String get loginSuptitle;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @infoAboutUs.
  ///
  /// In en, this message translates to:
  /// **'Info about us'**
  String get infoAboutUs;

  /// No description provided for @infoAboutQissatHirfati.
  ///
  /// In en, this message translates to:
  /// **'Info about Qissat Hirfati'**
  String get infoAboutQissatHirfati;

  /// No description provided for @infoAboutQissatHirfatiSuptitle.
  ///
  /// In en, this message translates to:
  /// **'Learn more about Our Story'**
  String get infoAboutQissatHirfatiSuptitle;

  /// No description provided for @ourHistory.
  ///
  /// In en, this message translates to:
  /// **'Our History'**
  String get ourHistory;

  /// No description provided for @ourHistorySuptitle.
  ///
  /// In en, this message translates to:
  /// **'Learn more about Our History'**
  String get ourHistorySuptitle;

  /// No description provided for @contactUsSuptitle.
  ///
  /// In en, this message translates to:
  /// **'We are happy to serve you at any time'**
  String get contactUsSuptitle;

  /// No description provided for @aboutUs_description.
  ///
  /// In en, this message translates to:
  /// **'A story of Saudi artisans crafting the future with the spirit of heritage and authenticity.'**
  String get aboutUs_description;

  /// No description provided for @ourGoals.
  ///
  /// In en, this message translates to:
  /// **'Our Goals'**
  String get ourGoals;

  /// No description provided for @ourGoals_description.
  ///
  /// In en, this message translates to:
  /// **'We pave the way towards a prosperous and bright future, blending the creativity of Saudi handicrafts with the deep heritage and proud authenticity we cherish.\n\nOur focus is not only on offering high-quality handcrafted products, but also on documenting and celebrating the rich details of Saudi culture. We aim to elevate traditional crafts and make them a bridge through which Saudi cultural heritage reaches the world, by adopting an innovative business model that supports and promotes this sector globally.'**
  String get ourGoals_description;

  /// No description provided for @ourVision.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get ourVision;

  /// No description provided for @ourVision_description.
  ///
  /// In en, this message translates to:
  /// **'We strive to become the leading and primary destination for Saudi handicrafts, combining authenticity with high quality to shine in local markets and reach global recognition.'**
  String get ourVision_description;

  /// No description provided for @ourMessage.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMessage;

  /// No description provided for @ourMessage_description.
  ///
  /// In en, this message translates to:
  /// **'We aim to present the finest Saudi handicrafts with exceptional quality, while enhancing their value as an essential part of Saudi heritage. We also seek to empower the handicraft sector by supporting artisans in a fair and sustainable way that ensures the continuation of this cultural legacy.'**
  String get ourMessage_description;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Qissat Hirfati'**
  String get appTitle;

  /// No description provided for @heritage.
  ///
  /// In en, this message translates to:
  /// **'Our Heritage'**
  String get heritage;

  /// No description provided for @heritage_description.
  ///
  /// In en, this message translates to:
  /// **'Saudi heritage is an artistic canvas blending the authenticity of the past with the civilizations that flourished on this land. From north to south, east to west, Saudi Arabia is rich in historical and archaeological sites that tell the stories of past generations.'**
  String get heritage_description;

  /// No description provided for @bisht_description.
  ///
  /// In en, this message translates to:
  /// **'The bisht is a symbol of Saudi identity and luxury, worn by kings and leaders on formal occasions. Crown Prince Mohammed bin Salman embodies it in a style that merges tradition and modernity. Click the bisht in the image to learn more.'**
  String get bisht_description;

  /// No description provided for @ourWork.
  ///
  /// In en, this message translates to:
  /// **'Our Work'**
  String get ourWork;

  /// No description provided for @ourWork_description.
  ///
  /// In en, this message translates to:
  /// **'We design products inspired by the deep-rooted heritage of our identity, drawing features of the present and shaping the future.'**
  String get ourWork_description;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @successPartners.
  ///
  /// In en, this message translates to:
  /// **'Success Partners'**
  String get successPartners;

  /// No description provided for @creativeHands.
  ///
  /// In en, this message translates to:
  /// **'Creative Saudi hands,\nweave the future with touches inspired by heritage and authenticity.'**
  String get creativeHands;

  /// No description provided for @overviewDescription.
  ///
  /// In en, this message translates to:
  /// **'We aim to elevate the future of Saudi handicrafts, offering modern creations infused with the spirit of authentic heritage.'**
  String get overviewDescription;

  /// No description provided for @aboutQissatHirfati.
  ///
  /// In en, this message translates to:
  /// **'About Qissat Hirfati'**
  String get aboutQissatHirfati;

  /// No description provided for @creativeSaudiHands.
  ///
  /// In en, this message translates to:
  /// **'Creative Saudi hands.'**
  String get creativeSaudiHands;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get enterYourName;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterYourEmail;

  /// No description provided for @sentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sent Successfully'**
  String get sentSuccessfully;

  /// No description provided for @thankYouForContactingUs.
  ///
  /// In en, this message translates to:
  /// **'Thank you for contacting us!'**
  String get thankYouForContactingUs;

  /// No description provided for @featureWillBeAvailableLater.
  ///
  /// In en, this message translates to:
  /// **'This feature will be available later'**
  String get featureWillBeAvailableLater;

  /// No description provided for @yourMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get yourMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'ja',
    'ru',
    'ur',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'ru':
      return AppLocalizationsRu();
    case 'ur':
      return AppLocalizationsUr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
