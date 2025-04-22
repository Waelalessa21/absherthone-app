import 'package:absherthone/absherthone_app.dart';
import 'package:absherthone/common/provider/lang.dart';
import 'package:absherthone/common/provider/theme.dart';
import 'package:absherthone/common/routing/app_router.dart';
import 'package:absherthone/features/login/data/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: AbsherthoneApp(appRouter: AppRouter()),
    ),
  );
}
