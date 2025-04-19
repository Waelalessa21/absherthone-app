import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 160,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.primary, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shield_outlined,
                color: colorScheme.primary,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 70,
            child: onBoardingIcons(
              colorScheme,
              Icons.lock,
              colorScheme.primary,
            ),
          ),
          Positioned(
            bottom: 70,
            right: 90,
            child: onBoardingIcons(
              colorScheme,
              Icons.warning_amber,
              colorScheme.error,
            ),
          ),
          Positioned(
            top: 100,
            right: 70,
            child: onBoardingIcons(
              colorScheme,
              Icons.security,
              colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

Widget onBoardingIcons(
    ColorScheme colorScheme, IconData icon, Color iconColor) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: colorScheme.surface,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Icon(
      icon,
      color: iconColor,
      size: 18,
    ),
  );
}
