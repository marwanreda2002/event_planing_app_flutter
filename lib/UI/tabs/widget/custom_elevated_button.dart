import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  TextStyle? textStyle;
  VoidCallback onTab;
  Widget? icon;
  Color? backgroundColor;

  CustomElevatedButton(
      {required this.text,
      this.textStyle,
      required this.onTab,
      this.icon,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(backgroundColor ?? AppColors.primaryLight),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          side: WidgetStatePropertyAll(
              BorderSide(color: AppColors.primaryLight, width: 2))),
      onPressed: onTab,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * (16 / screenHeight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            icon == null
                ? SizedBox()
                : SizedBox(
                    width: width * (1 / screenWidth),
                  ),
            Text(
              text,
              style: textStyle ?? AppStyle.medium20White,
            ),
          ],
        ),
      ),
    );
  }
}
