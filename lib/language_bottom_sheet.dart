import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/app_language_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

Map<String, String> languageDataMap = {};

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // saveDataToMap();
  }

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
              onTap: () {
                languageProvider.saveDataLang("en");
                languageProvider.getDataLang();
              },
              child: languageProvider.appLanguage == "en"
                  ? selectedItemWidget(AppLocalizations.of(context)!.english)
                  : notSelectedWidget(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                languageProvider.saveDataLang("ar");
                languageProvider.getDataLang();
              },
              child: languageProvider.appLanguage == "ar"
                  ? selectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : notSelectedWidget(AppLocalizations.of(context)!.arabic)),
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

// void saveDataToMap()async{
//   languageDataMap=await getDataLang();
//   setState(() {
//
//   });
// }
}
