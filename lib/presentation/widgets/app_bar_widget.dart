import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constants.dart';

class WidgetAppBar extends StatelessWidget {
  final String appBarName;
  const WidgetAppBar({super.key, required this.appBarName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          appBarName,
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          size: 30,
          color: Colors.white,
        ),
        kWidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kWidth
      ],
    );
  }
}
