import 'package:event_planing/UI/auth/login/login_screen.dart';
import 'package:event_planing/UI/auth/sign%20up/signup_Screen.dart';
import 'package:event_planing/UI/home_screen.dart';
import 'package:event_planing/UI/tabs/favorite/favorite_tab.dart';
import 'package:event_planing/UI/tabs/home/add_event/add_event.dart';
import 'package:event_planing/UI/tabs/profile/profile_tab.dart';
import 'package:event_planing/providers/app_language_provider.dart';
import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:event_planing/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppThemeProvider()),
    ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getDataForLang();
    getDataForTheme();

    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isLight ? ThemeMode.light : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ProfileTab.routeName: (_) => ProfileTab(),
        FavoriteTab.routeName: (_) => FavoriteTab(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        AddEvent.routeName: (_) => AddEvent(),
      },
    );
  }

  void getDataForLang() {
    Provider.of<AppLanguageProvider>(context).getDataLang();
  }

  void getDataForTheme() {
    Provider.of<AppThemeProvider>(context).getDataTheme();
  }
}
