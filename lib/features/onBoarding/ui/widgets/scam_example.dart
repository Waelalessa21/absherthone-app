import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScamExample extends StatelessWidget {
  const ScamExample({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: _buildScamCard(
            context,
            colorScheme,
            Icons.wallet,
            loc.second_on_boarding_first_option,
            loc.second_on_boarding_first_option_desc,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildScamCard(
            context,
            colorScheme,
            Icons.person,
            loc.second_on_boarding_second_option,
            loc.second_on_boarding_second_option_desc,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildScamCard(
            context,
            colorScheme,
            Icons.key,
            loc.second_on_boarding_third_option,
            loc.second_on_boarding_third_option_desc,
          ),
        ),
      ],
    );
  }

  Widget _buildScamCard(
    BuildContext context,
    ColorScheme colorScheme,
    IconData icon,
    String title,
    String example,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: colorScheme.error,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Text(
              example,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
