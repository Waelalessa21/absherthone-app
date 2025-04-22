import 'package:absherthone/common/layout/main_screen.dart';
import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/common/widgets/pop/message_popup.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/features/otp/ui/widgets/otp_input.dart';
import 'package:absherthone/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/otp_header.dart';
import 'widgets/otp_actions.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String name;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.name,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _sendOTP() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() => _isLoading = true);

    try {
      await authProvider.sendOTP(widget.phoneNumber);
      if (!mounted) return;
      setState(() => _isLoading = false);

      if (authProvider.status == AuthStatus.error) {
        showToastMessage(
          context,
          authProvider.errorMessage ?? 'Error sending OTP',
          "assets/icons/error.png",
          isError: true,
        );
      } else if (authProvider.status == AuthStatus.codeSent) {
        showToastMessage(
          context,
          "Verification code sent",
          "assets/icons/success.png",
          isError: false,
        );
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      showToastMessage(
        context,
        'Error sending OTP. Please try again',
        "assets/icons/error.png",
        isError: true,
      );
    }
  }

  Future<void> _verifyOTP() async {
    if (_otpController.text.length != 6) {
      showToastMessage(
        context,
        AppLocalizations.of(context).please_enter_valid_code,
        "assets/icons/error.png",
        isError: true,
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    setState(() => _isLoading = true);

    try {
      await authProvider.verifyOTP(_otpController.text);
      if (!mounted) return;

      if (authProvider.status == AuthStatus.authenticated) {
        await authProvider.updateUserProfile(widget.name);
        if (mounted) context.pushReplacementNamed(Routes.record);
      } else if (authProvider.status == AuthStatus.error) {
        setState(() => _isLoading = false);
        showToastMessage(
          context,
          authProvider.errorMessage ?? 'Error verifying OTP',
          "assets/icons/error.png",
          isError: true,
        );
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      showToastMessage(
        context,
        'Error verifying OTP. Please try again',
        "assets/icons/error.png",
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MainScreen(
      showHeader: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OtpHeader(phoneNumber: widget.phoneNumber),
            const SizedBox(height: 32),
            OtpInputField(controller: _otpController, onCompleted: _verifyOTP),
            const SizedBox(height: 24),
            OtpActions(
              isLoading: _isLoading,
              authProvider: authProvider,
              onResend: _sendOTP,
              onVerify: _verifyOTP,
            ),
          ],
        ),
      ),
    );
  }
}
