import 'package:flutter/material.dart';

class FraudItem extends StatefulWidget {
  final String date;
  final String status;
  final String phoneNumber;
  final String description;

  const FraudItem({
    super.key,
    required this.date,
    required this.status,
    required this.phoneNumber,
    required this.description,
  });

  @override
  FraudItemState createState() => FraudItemState();
}

class FraudItemState extends State<FraudItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusIndicator(widget.status, colorScheme),
              Text(
                widget.date,
                style: textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Center(
              child: Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/More.png',
                    width: 40,
                  ),
                ),
              ),
            ),
          ),
          if (isExpanded) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/icons/PhoneIcon.png',
                  width: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  widget.phoneNumber,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTag("احتيال بنكي", textTheme),
                const SizedBox(width: 10),
                _buildTag("تحويل فوري", textTheme),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(String status, ColorScheme colorScheme) {
    Color backgroundColor;
    Color textColor;

    if (status == "معلقة") {
      backgroundColor = colorScheme.secondary.withOpacity(0.15);
      textColor = colorScheme.secondary;
    } else if (status == "تم البلاغ") {
      backgroundColor = colorScheme.error.withOpacity(0.15);
      textColor = colorScheme.error;
    } else {
      backgroundColor = colorScheme.primary.withOpacity(0.15);
      textColor = colorScheme.primary;
    }

    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, TextTheme textTheme) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
