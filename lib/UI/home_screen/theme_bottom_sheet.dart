import 'package:event_planing/providers/app_theme_provider.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: themeProvider.themeMode == ThemeMode.light
                  ? selectedItemWidget(AppLocalizations.of(context)!.light)
                  : notSelectedWidget(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
              child: themeProvider.themeMode == ThemeMode.dark
                  ? selectedItemWidget(AppLocalizations.of(context)!.dark)
                  : notSelectedWidget(AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget selectedItemWidget(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang,
          style: AppStyle.bold20Primary,
        ),
        Icon(
          Icons.check,
          size: 25,
          color: AppColors.primaryLight,
        )
      ],
    );
  }

  Widget notSelectedWidget(String lang) {
    return Text(
      lang,
      style: AppStyle.bold20Black,
    );
  }
}
