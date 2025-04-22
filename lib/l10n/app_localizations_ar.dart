// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appname => 'نَـبِـــه';

  @override
  String get first_on_boarding_title => 'لا تكن الضحية القادمة';

  @override
  String get first_on_boarding_button => 'اسحب لمعرفة المزيد';

  @override
  String get second_on_boarding_title => 'الاحتيال في تزايد';

  @override
  String get second_on_boarding_script => 'يتلقى أكثر من 60٪ من البالغين مكالمات احتيال كل شهر. يستخدم المحتالون تقنيات متطورة لخداع الناس لمشاركة معلومات حساسة أو إجراء مدفوعات.';

  @override
  String get second_on_boarding_first_option => 'مكالمة بنكية مزيفة';

  @override
  String get second_on_boarding_first_option_desc => '\'تم اختراق حسابك عشان ترجعه ارسل رقم الحساب\'';

  @override
  String get second_on_boarding_second_option => 'إنتحال الهوية';

  @override
  String get second_on_boarding_second_option_desc => '\'أنا اتصل عليك من وزارة الداخلية\'';

  @override
  String get second_on_boarding_third_option => 'رمز التحقق';

  @override
  String get second_on_boarding_third_option_desc => '\'ارسلي الرمز المكون من اربع ارقام تراك فزت بجائزة\'';

  @override
  String get bank_name => 'قسم أمن البنك';

  @override
  String get incoming_call => 'مكالمة واردة';

  @override
  String get danger => 'خطر عالي';

  @override
  String get danger_reveal => 'تم اكتشاف احتيال';

  @override
  String get login_now => 'سجل الان';

  @override
  String get login => 'تسجيل دخول';

  @override
  String get phone => 'رقم الجوال';

  @override
  String get name => 'اسمك الاول';

  @override
  String get please_enter_required_fields => 'الرجاء التحقق من تعبئة المعلومات المطلوبة';

  @override
  String get please_enter_phone => 'أدخل رقم الجوال';

  @override
  String get please_enter_name => 'أدخل الاسم';

  @override
  String get login_by_phone_number => 'قم بإدخال رقم جوالك لانشاء حسابك في نبه';

  @override
  String get be_careful_title => 'إحذر! لا تكن عرضة للاحتيال';

  @override
  String get upload_title => 'أسحب او ارفع ملف صوتي هنا';

  @override
  String get upload_file_here => 'أرفع الملف هنا';

  @override
  String get supported_format => 'ارفع الملف الخاص بك من النسخ المدعومة';

  @override
  String get format => 'النسخ المدعومة';

  @override
  String get audio_title => 'تحقق الان من الاحتيال';

  @override
  String get audio_working => 'انت تقوم الان بالتسجيل';

  @override
  String get settings => 'الاعدادات';

  @override
  String get reports => 'التقارير';

  @override
  String get hold_to_record => 'استمر بالضغط للتسجيل';

  @override
  String get setting_first_header => 'كشف الاحتيال';

  @override
  String get enable_call_monitoring => 'تمكين مراقبة المكالمات';

  @override
  String get enable_call_monitoring_desc => 'مراقبة المكالمات لرصد الأنشطة المشبوهة';

  @override
  String get enable_notification => 'تفعيل الإشعارات';

  @override
  String get enable_notification_desc => 'تلقي تنبيهات بالمكالمات المشبوهة';

  @override
  String get setting_second_header => 'إدارة البيانات';

  @override
  String get show_report => 'عرض التقارير';

  @override
  String get be_nabih => 'خلك نبه! لا تشاركه أحد';

  @override
  String get delete_history => 'مسح السجل';

  @override
  String get detected_fraud => 'الاحتيالات المكتشفة';

  @override
  String get detected_fraud_desc => 'نَـبِـــه يوفر لك ملخص تفصيلي لمكالماتك';

  @override
  String get startJourney => 'تجاوز تسجيل الدخول';

  @override
  String get useModel => 'ابدا بتجربة النموذج';

  @override
  String get verification_code => 'رمز التحقق';

  @override
  String enter_code_sent_to(String phoneNumber) {
    return 'أدخل الرمز المرسل إلى $phoneNumber';
  }

  @override
  String get please_enter_valid_code => 'الرجاء إدخال رمز تحقق صالح';

  @override
  String get resend_code => 'إعادة إرسال الرمز';

  @override
  String get verify => 'تحقق';

  @override
  String get sign_out => 'تسجيل الخروج';
}
