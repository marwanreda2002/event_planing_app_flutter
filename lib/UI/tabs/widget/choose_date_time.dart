import 'package:event_planing/utils/app_style.dart';
import 'package:flutter/material.dart';

class ChooseDateTime extends StatelessWidget {
  ChooseDateTime(
      {required this.chooseDateOrTime,
      required this.onPressed,
      super.key,
      required this.icon,
      required this.dateOrTime});

  IconData icon;
  String dateOrTime;
  String chooseDateOrTime;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;

    return Row(
      children: [
        Icon(
          icon,
          size: 24,
        ),
        SizedBox(
          width: width * (10 / screenWidth),
        ),
        Text(
          dateOrTime,
          style: AppStyle.medium16Black,
        ),
        Spacer(),
        TextButton(
            onPressed: onPressed,
            child: Text(
              chooseDateOrTime,
              style: AppStyle.medium16Primary,
            )),
      ],
    );
  }
}
