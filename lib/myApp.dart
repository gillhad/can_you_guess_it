import 'package:can_you_guess_it/helpers/app_theme.dart';
import 'package:can_you_guess_it/helpers/navigation_router.dart';
import 'package:can_you_guess_it/helpers/navigationroutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeCustom.defaultTheme,
      initialRoute: NavigationRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
    );
  }
}
