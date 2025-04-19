import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: theme.textTheme.bodyMedium?.color ?? const Color(0xff6B7280),
      ),
    );
  }
}
