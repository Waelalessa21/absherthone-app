// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appname => 'Nabih';

  @override
  String get first_on_boarding_title => 'Don\'t Be the Next Victim';

  @override
  String get first_on_boarding_button => 'Swipe to Learn More';

  @override
  String get second_on_boarding_title => 'Fraud Is on the Rise';

  @override
  String get second_on_boarding_script => 'Over 60% of adults receive scam calls every month. Scammers use advanced techniques to trick people into sharing sensitive information or making payments.';

  @override
  String get second_on_boarding_first_option => 'Fake Bank Call';

  @override
  String get second_on_boarding_first_option_desc => '\'Your account has been compromised\'';

  @override
  String get second_on_boarding_second_option => 'ID Impersonation';

  @override
  String get second_on_boarding_second_option_desc => '\'I\'m calling from the Ministry of Interior\'';

  @override
  String get second_on_boarding_third_option => 'Send OTP-code';

  @override
  String get second_on_boarding_third_option_desc => '\'Send it to me, you\'ve won a prize\'';

  @override
  String get bank_name => 'Bank Security Department';

  @override
  String get incoming_call => 'Incoming Call';

  @override
  String get danger => 'High Risk';

  @override
  String get danger_reveal => 'Fraud Detected';

  @override
  String get login_now => 'login now';

  @override
  String get login => 'Login';

  @override
  String get phone => 'Phone number';

  @override
  String get name => 'First name';

  @override
  String get please_enter_required_fields => 'Please fill required information';

  @override
  String get please_enter_phone => 'Enter your phone number';

  @override
  String get please_enter_name => 'Enter your name';

  @override
  String get login_by_phone_number => 'Login with your phone number to create your account';

  @override
  String get be_careful_title => 'watch out! don\'t be next victm';

  @override
  String get upload_title => 'Drag and drop audio files here';

  @override
  String get upload_file_here => 'Upload Audio File';

  @override
  String get supported_format => 'Add your audio files in any supported format';

  @override
  String get format => 'supported format:';

  @override
  String get audio_title => 'Check if it\'s fraud';

  @override
  String get audio_working => 'Voice is working';

  @override
  String get settings => 'settings';

  @override
  String get reports => 'reports';

  @override
  String get hold_to_record => 'Hold to record';

  @override
  String get setting_first_header => 'Fraud detection';

  @override
  String get enable_call_monitoring => 'Enable caal moitoring';

  @override
  String get enable_call_monitoring_desc => 'Calls monitor to detect abnormal call';

  @override
  String get enable_notification => 'Enable notification';

  @override
  String get enable_notification_desc => 'Receive notification for sucepcios calls';

  @override
  String get setting_second_header => 'Data management';

  @override
  String get show_report => 'Show reports';

  @override
  String get be_nabih => 'Be Nabih! don\'t share it';

  @override
  String get delete_history => 'Delete history';

  @override
  String get detected_fraud => 'Detected calls';

  @override
  String get detected_fraud_desc => 'In Nabih you can have summary of all calls';

  @override
  String get startJourney => 'Start as guest';

  @override
  String get useModel => 'Use Ai model now';

  @override
  String get verification_code => 'Verification Code';

  @override
  String enter_code_sent_to(String phoneNumber) {
    return 'Enter the code sent to $phoneNumber';
  }

  @override
  String get please_enter_valid_code => 'Please enter a valid verification code';

  @override
  String get resend_code => 'Resend Code';

  @override
  String get verify => 'Verify';

  @override
  String get sign_out => 'Sign Out';
}
