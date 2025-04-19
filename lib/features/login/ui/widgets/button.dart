// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;

class AppButton extends StatelessWidget {
  final VoidCallback? press;
  final bool isShadowNeeded;
  final String text;

  const AppButton({
    this.text = "",
    super.key,
    this.press,
    this.isShadowNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onPrimary;
    final loc = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: isShadowNeeded
            ? [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.primary,
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text != "" ? text : loc.login,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontFamily:
                      loc.localeName == "en" ? "share" : 'IBMPlexSansArabic'),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_rounded,
              size: 20,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
