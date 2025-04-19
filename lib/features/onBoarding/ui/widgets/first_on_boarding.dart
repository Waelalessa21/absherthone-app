import 'package:absherthone/features/onBoarding/ui/widgets/hero_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstOnBoarding extends StatelessWidget {
  final VoidCallback onNextPressed;

  const FirstOnBoarding({
    super.key,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            loc.appname,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            loc.first_on_boarding_title,
            style: TextStyle(
              fontSize: 20,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const HeroSection(),
          const SizedBox(height: 40),
          OutlinedButton(
            onPressed: onNextPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(250, 50),
              side: BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                    : Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
            ),
            child: Text(
              loc.first_on_boarding_button,
            ),
          ),
        ],
      ),
    );
  }
}
