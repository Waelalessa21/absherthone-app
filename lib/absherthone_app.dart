import 'package:absherthone/common/provider/lang.dart';
import 'package:absherthone/common/provider/theme.dart';
import 'package:absherthone/common/routing/app_router.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AbsherthoneApp extends StatelessWidget {
  final AppRouter appRouter;

  const AbsherthoneApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Consumer2<ThemeProvider, LocaleProvider>(
          builder: (context, themeProvider, localeProvider, child) {
            final langCode = localeProvider.locale.languageCode;
            final fontFamily = langCode == 'ar' ? 'IBMPlexSansArabic' : 'Share';

            return MaterialApp(
              title: 'Absherthone',
              theme: themeProvider.getLightThemeWithFont(fontFamily),
              darkTheme: themeProvider.getDarkThemeWithFont(fontFamily),
              themeMode: themeProvider.themeMode,
              debugShowCheckedModeBanner: false,
              locale: localeProvider.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en'), Locale('ar')],
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: _getInitialRoute(context),
              navigatorObservers: [RouteObserver<ModalRoute<dynamic>>()],
              onUnknownRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: Center(
                      child: Text("Page not found: ${settings.name}"),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  String _getInitialRoute(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.isAuthenticated) {
      return Routes.record;
    }

    return Routes.onBoarding;
  }
}
