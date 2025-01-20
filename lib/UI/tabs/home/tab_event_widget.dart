import 'package:event_planing/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  String eventName;
  bool isSelected;
  TextStyle? selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  Color? selectedBackGroundColor;
  Color? borderColor;

  TabEventWidget({super.key,
    this.borderColor,
    this.selectedBackGroundColor,
    this.unSelectedTextStyle,
    this.selectedTextStyle,
    required this.eventName,
    required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.003),
      decoration: BoxDecoration(
        color: isSelected ? selectedBackGroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(37),
        border:
            Border.all(color: borderColor ?? AppColors.whiteColor, width: 2),
      ),
      child: Center(
          child: Text(eventName,
              style: isSelected ? selectedTextStyle : unSelectedTextStyle)),
    );
  }
}
