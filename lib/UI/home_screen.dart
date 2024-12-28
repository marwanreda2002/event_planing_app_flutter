import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:event_planing/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_language_provider.dart';
import 'tabs/favorite/favorite_tab.dart';
import 'tabs/home/home_tab.dart';
import 'tabs/map/map_tab.dart';
import 'tabs/profile/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.transparentColor,
        ),
        child: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            unselectedItemColor: AppColors.whiteColor,
            fixedColor: AppColors.whiteColor,
            selectedLabelStyle: AppStyle.bold12White,
            unselectedLabelStyle: AppStyle.bold12White,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex,
            items: [
              buildBottomNavItem(
                  index: 0,
                  unSelectedImg: AssetsManager.iconHome,
                  selectedImg: AssetsManager.iconHomeSelected,
                  label: AppLocalizations.of(context)!.home),
              buildBottomNavItem(
                  index: 1,
                  unSelectedImg: AssetsManager.iconMap,
                  selectedImg: AssetsManager.iconMapSelected,
                  label: AppLocalizations.of(context)!.map),
              buildBottomNavItem(
                  index: 2,
                  unSelectedImg: AssetsManager.iconFavorite,
                  selectedImg: AssetsManager.iconFavoriteSelected,
                  label: AppLocalizations.of(context)!.favortie),
              buildBottomNavItem(
                  index: 3,
                  unSelectedImg: AssetsManager.iconProfile,
                  selectedImg: AssetsManager.iconProfileSelected,
                  label: AppLocalizations.of(context)!.profile),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavItem(
      {required String unSelectedImg,
      required String label,
      required int index,
      required selectedImg}) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        color: Colors.white,
        AssetImage(index == selectedIndex ? selectedImg : unSelectedImg),
        size: 25,
      ),
      label: label,
    );
  }
}
