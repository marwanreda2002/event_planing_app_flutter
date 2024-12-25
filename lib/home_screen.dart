import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_language_provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Text("data"),
    );
  }

  BottomNavigationBarItem buildBottomNavItem(
      {required String selectedImg, required String label}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(selectedImg)), label: label);
  }
}
