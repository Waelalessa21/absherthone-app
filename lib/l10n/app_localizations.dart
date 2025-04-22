import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appname.
  ///
  /// In en, this message translates to:
  /// **'Nabih'**
  String get appname;

  /// No description provided for @first_on_boarding_title.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Be the Next Victim'**
  String get first_on_boarding_title;

  /// No description provided for @first_on_boarding_button.
  ///
  /// In en, this message translates to:
  /// **'Swipe to Learn More'**
  String get first_on_boarding_button;

  /// No description provided for @second_on_boarding_title.
  ///
  /// In en, this message translates to:
  /// **'Fraud Is on the Rise'**
  String get second_on_boarding_title;

  /// No description provided for @second_on_boarding_script.
  ///
  /// In en, this message translates to:
  /// **'Over 60% of adults receive scam calls every month. Scammers use advanced techniques to trick people into sharing sensitive information or making payments.'**
  String get second_on_boarding_script;

  /// No description provided for @second_on_boarding_first_option.
  ///
  /// In en, this message translates to:
  /// **'Fake Bank Call'**
  String get second_on_boarding_first_option;

  /// No description provided for @second_on_boarding_first_option_desc.
  ///
  /// In en, this message translates to:
  /// **'\'Your account has been compromised\''**
  String get second_on_boarding_first_option_desc;

  /// No description provided for @second_on_boarding_second_option.
  ///
  /// In en, this message translates to:
  /// **'ID Impersonation'**
  String get second_on_boarding_second_option;

  /// No description provided for @second_on_boarding_second_option_desc.
  ///
  /// In en, this message translates to:
  /// **'\'I\'m calling from the Ministry of Interior\''**
  String get second_on_boarding_second_option_desc;

  /// No description provided for @second_on_boarding_third_option.
  ///
  /// In en, this message translates to:
  /// **'Send OTP-code'**
  String get second_on_boarding_third_option;

  /// No description provided for @second_on_boarding_third_option_desc.
  ///
  /// In en, this message translates to:
  /// **'\'Send it to me, you\'ve won a prize\''**
  String get second_on_boarding_third_option_desc;

  /// No description provided for @bank_name.
  ///
  /// In en, this message translates to:
  /// **'Bank Security Department'**
  String get bank_name;

  /// No description provided for @incoming_call.
  ///
  /// In en, this message translates to:
  /// **'Incoming Call'**
  String get incoming_call;

  /// No description provided for @danger.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get danger;

  /// No description provided for @danger_reveal.
  ///
  /// In en, this message translates to:
  /// **'Fraud Detected'**
  String get danger_reveal;

  /// No description provided for @login_now.
  ///
  /// In en, this message translates to:
  /// **'login now'**
  String get login_now;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get name;

  /// No description provided for @please_enter_required_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill required information'**
  String get please_enter_required_fields;

  /// No description provided for @please_enter_phone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get please_enter_phone;

  /// No description provided for @please_enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get please_enter_name;

  /// No description provided for @login_by_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Login with your phone number to create your account'**
  String get login_by_phone_number;

  /// No description provided for @be_careful_title.
  ///
  /// In en, this message translates to:
  /// **'watch out! don\'t be next victm'**
  String get be_careful_title;

  /// No description provided for @upload_title.
  ///
  /// In en, this message translates to:
  /// **'Drag and drop audio files here'**
  String get upload_title;

  /// No description provided for @upload_file_here.
  ///
  /// In en, this message translates to:
  /// **'Upload Audio File'**
  String get upload_file_here;

  /// No description provided for @supported_format.
  ///
  /// In en, this message translates to:
  /// **'Add your audio files in any supported format'**
  String get supported_format;

  /// No description provided for @format.
  ///
  /// In en, this message translates to:
  /// **'supported format:'**
  String get format;

  /// No description provided for @audio_title.
  ///
  /// In en, this message translates to:
  /// **'Check if it\'s fraud'**
  String get audio_title;

  /// No description provided for @audio_working.
  ///
  /// In en, this message translates to:
  /// **'Voice is working'**
  String get audio_working;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'settings'**
  String get settings;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'reports'**
  String get reports;

  /// No description provided for @hold_to_record.
  ///
  /// In en, this message translates to:
  /// **'Hold to record'**
  String get hold_to_record;

  /// No description provided for @setting_first_header.
  ///
  /// In en, this message translates to:
  /// **'Fraud detection'**
  String get setting_first_header;

  /// No description provided for @enable_call_monitoring.
  ///
  /// In en, this message translates to:
  /// **'Enable caal moitoring'**
  String get enable_call_monitoring;

  /// No description provided for @enable_call_monitoring_desc.
  ///
  /// In en, this message translates to:
  /// **'Calls monitor to detect abnormal call'**
  String get enable_call_monitoring_desc;

  /// No description provided for @enable_notification.
  ///
  /// In en, this message translates to:
  /// **'Enable notification'**
  String get enable_notification;

  /// No description provided for @enable_notification_desc.
  ///
  /// In en, this message translates to:
  /// **'Receive notification for sucepcios calls'**
  String get enable_notification_desc;

  /// No description provided for @setting_second_header.
  ///
  /// In en, this message translates to:
  /// **'Data management'**
  String get setting_second_header;

  /// No description provided for @show_report.
  ///
  /// In en, this message translates to:
  /// **'Show reports'**
  String get show_report;

  /// No description provided for @be_nabih.
  ///
  /// In en, this message translates to:
  /// **'Be Nabih! don\'t share it'**
  String get be_nabih;

  /// No description provided for @delete_history.
  ///
  /// In en, this message translates to:
  /// **'Delete history'**
  String get delete_history;

  /// No description provided for @detected_fraud.
  ///
  /// In en, this message translates to:
  /// **'Detected calls'**
  String get detected_fraud;

  /// No description provided for @detected_fraud_desc.
  ///
  /// In en, this message translates to:
  /// **'In Nabih you can have summary of all calls'**
  String get detected_fraud_desc;

  /// No description provided for @startJourney.
  ///
  /// In en, this message translates to:
  /// **'Start as guest'**
  String get startJourney;

  /// No description provided for @useModel.
  ///
  /// In en, this message translates to:
  /// **'Use Ai model now'**
  String get useModel;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code;

  /// No description provided for @enter_code_sent_to.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to {phoneNumber}'**
  String enter_code_sent_to(String phoneNumber);

  /// No description provided for @please_enter_valid_code.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid verification code'**
  String get please_enter_valid_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resend_code;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get sign_out;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
