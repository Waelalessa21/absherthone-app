import 'package:absherthone/common/provider/lang.dart';
import 'package:absherthone/common/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headerLogo(),
          const HeaderControls(),
        ],
      ),
    );
  }

  Widget headerLogo() {
    return Image.asset(
      'assets/images/Nabeh Logo.png',
      height: 35.h,
    );
  }
}

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({
    super.key,
    this.title,
    this.actions,
    this.showLogo = true,
    this.showLanguageToggle = true,
    this.showThemeToggle = true,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool showLogo;
  final bool showLanguageToggle;
  final bool showThemeToggle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    List<Widget> headerActions = [];

    if (showThemeToggle || showLanguageToggle) {
      headerActions.add(HeaderControls(
        showThemeToggle: showThemeToggle,
        showLanguageToggle: showLanguageToggle,
      ));
    }

    if (actions != null) {
      headerActions.addAll(actions!);
    }

    return AppBar(
      title: showLogo ? headerLogo() : title,
      actions: headerActions,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  Widget headerLogo() {
    return Image.asset(
      'assets/images/.png',
      height: 24.h,
    );
  }
}

class HeaderControls extends StatelessWidget {
  const HeaderControls({
    super.key,
    this.showThemeToggle = true,
    this.showLanguageToggle = true,
  });

  final bool showThemeToggle;
  final bool showLanguageToggle;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Row(
      children: [
        if (showLanguageToggle)
          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: localeProvider.toggleLocale,
            child: Container(
              padding: EdgeInsets.all(8.r),
              child: Icon(
                Icons.language,
                size: 18.sp,
              ),
            ),
          ),
        if (showLanguageToggle && showThemeToggle) SizedBox(width: 8.w),
        if (showThemeToggle)
          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: themeProvider.toggleTheme,
            child: Container(
              padding: EdgeInsets.all(8.r),
              child: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color:
                    isDark ? const Color(0xFF6366F1) : const Color(0xFFF59E0B),
                size: 18.sp,
              ),
            ),
          ),
      ],
    );
  }
}
