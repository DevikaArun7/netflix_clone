import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

Column customButtonWidget(
    {required IconData icon,
    required String title,
    double iconSize = 20,
    double textSize = 20}) {
  return Column(
    children: [
      Icon(
        icon,
        color: kWhiteColor,
        size: iconSize,
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: textSize),
      )
    ],
  );
}
