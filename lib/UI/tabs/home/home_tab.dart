import 'package:event_planing/UI/tabs/home/tab_event_widget.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:event_planing/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../favorite/favorite_tab.dart';
import '../map/map_tab.dart';
import '../profile/profile_tab.dart';
import 'event_item_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

int selectedIndex = 0;
List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    // int selectedIndex = 0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryLight,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.welcome_back}✨",
                  style: AppStyle.bold12White,
                ),
                Text(
                  "Marwan Reda",
                  style: AppStyle.bold24White,
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.wb_sunny_outlined,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.02,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "En",
                style: AppStyle.bold14Primary,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.001, horizontal: width * 0.03),
            height: height * 0.111,
            decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(AssetsManager.iconMap),
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      "Alex , Egypt",
                      style: AppStyle.medium14White,
                    )
                  ],
                ),
                DefaultTabController(
                  length: eventsNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      selectedIndex = index;
                      // print(selectedIndex);
                      setState(() {});
                    },
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.02),
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    tabs: eventsNameList.map((eventName) {
                      return TabEventWidget(
                          eventName: eventName,
                          isSelected: selectedIndex ==
                              eventsNameList.indexOf(eventName));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return EventItemWidget();
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
