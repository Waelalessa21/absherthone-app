import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color textColor;
  final VoidCallback onTap;
  final Color colors;

  const SettingsButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.textColor,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
              color: colors,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: theme.iconTheme.color?.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
