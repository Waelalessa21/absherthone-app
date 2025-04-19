import 'package:absherthone/common/widgets/custom_shapes/app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool showHeader;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  const MainScreen({
    super.key,
    required this.child,
    this.backgroundColor,
    this.showHeader = true,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        child: Column(
          children: [
            if (showHeader) const MobileHeader(),
            Expanded(child: child),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
