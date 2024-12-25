import 'package:event_planing/UI/tabs/favorite/favorite_tab.dart';
import 'package:event_planing/UI/tabs/home/home_tab.dart';
import 'package:event_planing/UI/tabs/map/map_tab.dart';
import 'package:event_planing/language_bottom_sheet.dart';
import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:event_planing/theme_bottom_sheet.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../utils/assets_manager.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  static String routeName = "/";

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.dark
          ? AppColors.primaryDark
          : Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.transparentColor,
        ),
        child: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
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
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        toolbarHeight: height * (0.20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
        ),
        title: Row(
          children: [
            Image.asset(AssetsManager.routeImage),
            SizedBox(
              width: width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Marwan Reda",
                  style: AppStyle.bold24White,
                ),
                Text(
                  "ma5853505@gmail.com",
                  style: AppStyle.medium16White,
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: AppStyle.bold20Black,
            ),
            SizedBox(
              height: height * (16 / 841),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (_) => LanguageBottomSheet());
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryLight,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.appLanguage == "ar"
                          ? AppLocalizations.of(context)!.arabic
                          : AppLocalizations.of(context)!.english,
                      style: AppStyle.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * (16 / 841),
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: AppStyle.bold20Black,
            ),
            SizedBox(
              height: height * (16 / 841),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (_) => ThemeBottomSheet());
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primaryLight,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.themeMode == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: AppStyle.bold20Primary,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
