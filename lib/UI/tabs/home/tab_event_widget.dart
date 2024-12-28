import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  String eventName;
  bool isSelected;

  TabEventWidget(
      {super.key, required this.eventName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.003),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.whiteColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: Text(eventName,
          style:
              isSelected ? AppStyle.medium16Primary : AppStyle.medium16White),
    );
  }
}
