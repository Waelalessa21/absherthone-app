import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:absherthone/l10n/app_localizations.dart';
import 'package:absherthone/common/helper/validator.dart';
import 'package:absherthone/common/widgets/pop/message_popup.dart';
import 'package:absherthone/features/login/ui/otp_screen.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/features/login/ui/widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authProvider = Provider.of<AuthProvider>(context, listen: false);
      _authProvider.addListener(_onAuthStatusChanged);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _authProvider.removeListener(_onAuthStatusChanged);
    super.dispose();
  }

  void _onAuthStatusChanged() {
    if (!mounted) return;

    final phoneNumber = _phoneController.text.trim();
    final name = _nameController.text.trim();

    if (_authProvider.status == AuthStatus.codeSent) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            phoneNumber: phoneNumber,
            name: name,
          ),
        ),
      );
    } else if (_authProvider.status == AuthStatus.error) {
      showToastMessage(
        context,
        _authProvider.errorMessage ?? 'حدث خطأ أثناء التحقق',
        "assets/icons/error.png",
        isError: true,
      );
    }

    setState(() {
      _isLoading = _authProvider.status == AuthStatus.loading;
    });
  }

  Future<void> _submitPhone() async {
    if (!_formKey.currentState!.validate()) {
      showToastMessage(
        context,
        AppLocalizations.of(context).please_enter_required_fields,
        "assets/icons/error.png",
        isError: true,
      );
      return;
    }

    final phoneNumber = _phoneController.text.trim();
    final name = _nameController.text.trim();

    setState(() {
      _isLoading = true;
    });

    try {
      await _authProvider.sendOTP(phoneNumber);

      if (_authProvider.status == AuthStatus.error && mounted) {
        showToastMessage(
          context,
          _authProvider.errorMessage ?? "Error sending verification code",
          "assets/icons/error.png",
          isError: true,
        );

        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        showToastMessage(
          context,
          "Error sending verification code. Please try again",
          "assets/icons/error.png",
          isError: true,
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: loc.phone,
              prefixIcon: const Icon(Icons.mobile_friendly),
              hintText: '05XXXXXXXX',
            ),
            validator: (value) =>
                AppRegex.validate(value, loc.please_enter_phone),
          ),
          const SizedBox(height: 28),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: loc.name,
              prefixIcon: const Icon(Icons.supervised_user_circle_outlined),
            ),
            validator: (value) =>
                (value == null || value.isEmpty) ? loc.please_enter_name : null,
          ),
          const SizedBox(height: 64),
          _isLoading || authProvider.status == AuthStatus.loading
              ? const CircularProgressIndicator()
              : AppButton(press: _submitPhone)
        ],
      ),
    );
  }
}
