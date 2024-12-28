import 'package:event_planing/UI/tabs/widget/custom_text_field.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/event_item_widget.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  static String routeName = "favorite tab";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: height * (64 / screenHeight),
              bottom: height * (16 / screenHeight),
              left: width * (16 / screenWidth),
              right: width * (16 / screenWidth),
            ),
            child: CustomTextField(
              borderColor: AppColors.primaryLight,
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: AppStyle.bold14Primary,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primaryLight,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
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
