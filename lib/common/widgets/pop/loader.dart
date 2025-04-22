import 'package:flutter/material.dart';

class AppIconLoader extends StatefulWidget {
  final double size;
  final Duration bounceDuration;

  const AppIconLoader({
    super.key,
    this.size = 80,
    this.bounceDuration = const Duration(milliseconds: 800),
  });

  @override
  State<AppIconLoader> createState() => _AppIconLoaderState();
}

class _AppIconLoaderState extends State<AppIconLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: widget.bounceDuration,
    );

    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.easeInOut,
      ),
    );

    _bounceController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _bounceAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -10 * _bounceAnimation.value),
            child: child,
          );
        },
        child: Image.asset(
          "assets/images/Nabeh Logo.png",
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
    );
  }
}
