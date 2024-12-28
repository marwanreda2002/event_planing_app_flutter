import 'package:event_planing/UI/auth/login/login_screen.dart';
import 'package:event_planing/UI/tabs/profile/language_bottom_sheet.dart';
import 'package:event_planing/UI/tabs/profile/theme_bottom_sheet.dart';
import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../utils/assets_manager.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  static String routeName = "profile tab";

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      backgroundColor:
          themeProvider.isLight ? Colors.white : AppColors.primaryDark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                      themeProvider.isLight
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
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.redColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ))),
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * (16 / screenHeight)),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 24,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      width: width * (8 / screenWidth),
                    ),
                    Text(
                      AppLocalizations.of(context)!.logout,
                      style: AppStyle.regular20White,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * (24 / screenHeight),
            )
          ],
        ),
      ),
    );
  }
}
