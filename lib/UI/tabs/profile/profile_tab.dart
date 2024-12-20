import 'package:event_planing/UI/home_screen/language_bottom_sheet.dart';
import 'package:event_planing/UI/home_screen/theme_bottom_sheet.dart';
import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_language_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  static String routeName = "/";

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
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
}
