import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? press;
  final bool isShadowNeeded;

  const AppButton({
    super.key,
    this.press,
    this.isShadowNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onPrimary;
    final loc = AppLocalizations.of(context)!;

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
              loc.login,
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
