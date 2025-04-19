import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/widgets/custom_shapes/text_and_icon.dart';
import 'package:absherthone/features/report/ui/widgets/fraud_item.dart';
import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation ?? 2,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: theme.iconTheme.color,
          ),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextAndIcon(
              iconPath: "assets/icons/bar-chart.png",
              label: loc.detected_fraud,
              description: loc.detected_fraud_desc,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            const FraudItem(
                date: "٢ رمضان، ١٤٤٦",
                status: "معلقة",
                phoneNumber: '0542772934',
                description:
                    'متصل مشبوه يدعي أنه من البنك ويطلب معلومات حساسة وتحويلاً مالياً فورياً'),
          ],
        ),
      ),
    );
  }
}
