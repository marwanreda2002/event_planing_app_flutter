import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:event_planing/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    return Container(
      height: height * (203 / screenHeight),
      margin: EdgeInsets.only(
          top: height * (16 / screenHeight),
          left: width * (16 / screenWidth),
          right: width * (16 / screenWidth)),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryLight,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(AssetsManager.birthdayImage),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * (43 / screenWidth),
            height: height * (49 / screenHeight),
            margin: EdgeInsets.symmetric(
                vertical: height * (8 / screenHeight),
                horizontal: width * (8 / screenWidth)),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "21\nNov",
              style: AppStyle.bold20Primary,
            ),
          ),
          Spacer(),
          Container(
            height: height * (40 / screenHeight),
            width: width * (345 / screenWidth),
            padding: EdgeInsets.symmetric(
              vertical: height * (10 / screenHeight),
              horizontal: width * (8 / screenWidth),
            ),
            margin: EdgeInsets.symmetric(
                vertical: height * (8 / screenHeight),
                horizontal: width * (8 / screenWidth)),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "This is a Birthday Party ",
                  style: AppStyle.bold14Black,
                )),
                ImageIcon(
                  AssetImage(AssetsManager.iconFavorite),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
