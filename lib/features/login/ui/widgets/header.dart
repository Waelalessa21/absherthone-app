import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/Nabeh Logo.png",
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        Text(
          loc.login_by_phone_number,
          style: textTheme.titleMedium,
        )
      ],
    );
  }
}
