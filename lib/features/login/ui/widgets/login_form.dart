import 'package:absherthone/common/helper/validator.dart';
import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/common/widgets/pop/message_popup.dart';
import 'package:absherthone/features/login/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
            validator: (value) {
              return AppRegex.validate(
                value,
                loc.please_enter_phone,
              );
            },
          ),
          const SizedBox(height: 28),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: loc.name,
              prefixIcon: const Icon(Icons.supervised_user_circle_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return loc.please_enter_name;
              }
              return null;
            },
          ),
          const SizedBox(height: 64),
          AppButton(
            press: () {
              if (_formKey.currentState!.validate()) {
                context.pushNamed(Routes.record);
              } else {
                showToastMessage(
                  context,
                  loc.please_enter_required_fields,
                  "assets/icons/error.png",
                  isError: false,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
