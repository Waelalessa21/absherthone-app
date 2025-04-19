import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/features/onBoarding/ui/widgets/scam_example.dart';
import 'package:absherthone/features/onBoarding/ui/widgets/warning_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondOnBoarding extends StatelessWidget {
  const SecondOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            loc.second_on_boarding_title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            loc.second_on_boarding_script,
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onBackground,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const ScamExample(),
          const SizedBox(height: 30),
          const WarningSection(),
          const SizedBox(height: 60),
          OutlinedButton(
            onPressed: () {
              context.pushNamed(Routes.login);
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(250, 50),
              side: BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                    : Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
            ),
            child: Text(loc.login_now),
          ),
        ],
      ),
    );
  }
}
