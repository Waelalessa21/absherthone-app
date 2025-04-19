import 'package:flutter/material.dart';

void showFraudWarningDialog(BuildContext context, String tag, int riskLevel) {
  Color progressColor;
  Color borderColor;
  Color iconColor;

  if (riskLevel <= 25) {
    progressColor = const Color(0xffF12828);
    borderColor = const Color(0xffF12828);
    iconColor = const Color(0xffF12828);
  } else if (riskLevel <= 50) {
    progressColor = const Color(0xffC92121);
    borderColor = const Color(0xffC92121);
    iconColor = const Color(0xffC92121);
  } else {
    progressColor = const Color(0xff911717);
    borderColor = const Color(0xff911717);
    iconColor = const Color(0xff911717);
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor, width: 2),
        ),
        backgroundColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.warning_rounded, color: iconColor, size: 24),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "تحذير: تم الكشف عن عملية احتيال!",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "تم اكتشاف علامة احتيال: \"$tag\".",
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff878787),
                ),
              ),
              const SizedBox(height: 25),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "مستوى الخطورة",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff4B5563),
                      ),
                    ),
                    Text(
                      "$riskLevel%",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: progressColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Directionality(
                textDirection: TextDirection.ltr,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    value: riskLevel / 100,
                    backgroundColor: const Color(0xffE5E7EB),
                    color: progressColor,
                    minHeight: 6,
                  ),
                ),
              ),
            ]),
      );
    },
  );
}
