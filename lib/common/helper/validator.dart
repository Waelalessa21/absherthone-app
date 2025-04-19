class AppRegex {
  static String? validate(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    final cleanedValue = value.replaceAll(RegExp(r'[\s\-()]'), '');

    final RegExp saudiMobileRegex = RegExp(r'^(05\d{8}|(\+|00)9665\d{8})$');

    if (!saudiMobileRegex.hasMatch(cleanedValue)) {
      return errorMessage;
    }

    return null;
  }
}
