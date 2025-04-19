import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final int currentPage;
  const Dots(
    ColorScheme colorScheme, {
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? colorScheme.primary
                : colorScheme.onBackground.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
