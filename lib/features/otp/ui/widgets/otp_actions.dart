import 'package:absherthone/common/widgets/pop/loader.dart';
import 'package:flutter/material.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/l10n/app_localizations.dart';
import 'package:absherthone/features/login/ui/widgets/button.dart';

class OtpActions extends StatelessWidget {
  final bool isLoading;
  final AuthProvider authProvider;
  final VoidCallback onResend;
  final VoidCallback onVerify;

  const OtpActions({
    super.key,
    required this.isLoading,
    required this.authProvider,
    required this.onResend,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: authProvider.status == AuthStatus.loading || isLoading
                ? null
                : onResend,
            child: Text(loc.resend_code),
          ),
        ),
        const SizedBox(height: 48),
        isLoading || authProvider.status == AuthStatus.loading
            ? const Center(child: AppIconLoader())
            : AppButton(
                text: loc.verify,
                press: onVerify,
              ),
      ],
    );
  }
}
