import 'package:absherthone/common/layout/main_screen.dart';
import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/features/settings/ui/widgets/card.dart';
import 'package:absherthone/features/settings/ui/widgets/header.dart';
import 'package:absherthone/features/settings/ui/widgets/setting_button.dart';
import 'package:absherthone/features/settings/ui/widgets/switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool isCallMonitoringEnabled = false;
  bool isNotificationsEnabled = false;

  Future<void> _signOut() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.signOut();
    if (mounted) {
      context.pushReplacementNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);

    return MainScreen(
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SectionHeader(title: loc.setting_first_header),
            const SizedBox(height: 10),
            SettingsCard(
              child: Column(
                children: [
                  SwitchTile(
                    title: loc.enable_call_monitoring,
                    subtitle: loc.enable_call_monitoring_desc,
                    value: isCallMonitoringEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        isCallMonitoringEnabled = value;
                      });
                    },
                  ),
                  Divider(height: 1, color: theme.dividerColor),
                  SwitchTile(
                    title: loc.enable_notification,
                    subtitle: loc.enable_notification_desc,
                    value: isNotificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        isNotificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SectionHeader(title: loc.setting_second_header),
            const SizedBox(height: 10),
            SettingsCard(
              child: Column(
                children: [
                  SettingsButton(
                    title: loc.show_report,
                    imagePath: "assets/icons/view_report.png",
                    textColor: Colors.greenAccent.shade400,
                    onTap: () {},
                    colors: Colors.greenAccent.shade400,
                  ),
                  Divider(height: 1, color: theme.dividerColor),
                  SettingsButton(
                    title: loc.delete_history,
                    imagePath: "assets/icons/delete.png",
                    textColor: theme.colorScheme.error,
                    onTap: () {},
                    colors: theme.colorScheme.error,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SettingsCard(
              child: SettingsButton(
                title: loc.sign_out,
                imagePath: "assets/icons/delete.png",
                textColor: theme.colorScheme.error,
                onTap: _signOut,
                colors: theme.colorScheme.error,
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
