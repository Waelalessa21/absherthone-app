import 'package:flutter/material.dart';

void showCallerAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: Image.asset('assets/icons/warning.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                "تم اكتشاف متصل مشبوه",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "تنبيه خطر عالي",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffCA8A04),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "مكالمة واردة من رقم غير معروف، تم اكتشاف خطر احتيال محتمل.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff4B5563),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ));
    },
  );
}
