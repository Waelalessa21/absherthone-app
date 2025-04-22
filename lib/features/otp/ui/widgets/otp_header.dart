import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart';

class OtpHeader extends StatelessWidget {
  final String phoneNumber;

  const OtpHeader({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.verification_code,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          loc.be_nabih,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 32),
        Text(
          loc.enter_code_sent_to(phoneNumber),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
