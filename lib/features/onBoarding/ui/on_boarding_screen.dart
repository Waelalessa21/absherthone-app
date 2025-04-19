import 'package:absherthone/common/layout/main_screen.dart';
import 'package:absherthone/features/onBoarding/ui/widgets/dots.dart';
import 'package:absherthone/features/onBoarding/ui/widgets/first_on_boarding.dart';
import 'package:absherthone/features/onBoarding/ui/widgets/second_on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MainScreen(
      showHeader: true,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                FirstOnBoarding(
                  onNextPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const SecondOnBoarding(),
              ],
            ),
          ),
          Dots(
            colorScheme,
            currentPage: _currentPage,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
