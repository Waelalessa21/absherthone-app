import 'package:absherthone/common/layout/main_screen.dart';
import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/common/widgets/pop/message_popup.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/features/login/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

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
        if (mounted) {
          showToastMessage(
            context,
            authProvider.errorMessage ?? 'Error sending OTP',
            "assets/icons/error.png",
            isError: true,
          );
        }
      } else if (authProvider.status == AuthStatus.codeSent) {
        if (mounted) {
          showToastMessage(
            context,
            "Verification code sent",
            "assets/icons/success.png",
            isError: false,
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      if (mounted) {
        showToastMessage(
          context,
          'Error sending OTP. Please try again',
          "assets/icons/error.png",
          isError: true,
        );
      }
    }
  }

  Future<void> _verifyOTP() async {
    if (!mounted) return;

    if (_otpController.text.length != 6) {
      if (!mounted) return;
      showToastMessage(
        context,
        AppLocalizations.of(context).please_enter_valid_code,
        "assets/icons/error.png",
        isError: true,
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!mounted) return;
    setState(() => _isLoading = true);

    try {
      await authProvider.verifyOTP(_otpController.text);
      if (!mounted) return;

      if (authProvider.status == AuthStatus.authenticated) {
        await authProvider.updateUserProfile(widget.name);
        if (mounted) {
          context.pushReplacementNamed(Routes.record);
        }
      } else if (authProvider.status == AuthStatus.error) {
        if (!mounted) return;
        setState(() => _isLoading = false);

        if (mounted) {
          showToastMessage(
            context,
            authProvider.errorMessage ?? 'Error verifying OTP',
            "assets/icons/error.png",
            isError: true,
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);

      if (mounted) {
        showToastMessage(
          context,
          'Error verifying OTP. Please try again',
          "assets/icons/error.png",
          isError: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return MainScreen(
      showHeader: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.verification_code,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              loc.enter_code_sent_to(widget.phoneNumber),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  onChanged: (value) {},
                  onCompleted: (value) => _verifyOTP(),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,

                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Theme.of(context)
                        .scaffoldBackgroundColor, // ✅ إزالة الخلفية
                    selectedFillColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    inactiveFillColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    activeColor: Theme.of(context).colorScheme.primary,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    inactiveColor: Theme.of(context).colorScheme.outline,
                  ),
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed:
                    authProvider.status == AuthStatus.loading || _isLoading
                        ? null
                        : _sendOTP,
                child: Text(loc.resend_code),
              ),
            ),
            const SizedBox(height: 48),
            _isLoading || authProvider.status == AuthStatus.loading
                ? Center(child: CircularProgressIndicator())
                : AppButton(
                    text: loc.verify,
                    press: _verifyOTP,
                  )
          ],
        ),
      ),
    );
  }
}
