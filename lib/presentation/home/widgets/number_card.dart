import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class WidgetNumberCard extends StatelessWidget {
  const WidgetNumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                width: 170,
                // height: 230,
                decoration: BoxDecoration(
                    borderRadius: kRadius10,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://m.media-amazon.com/images/M/MV5BYzFhM2M1MDUtNDhmNC00YzEzLThiMzctYWYxZTc0MGJhNWYyXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000_.jpg'))),
              ),
            ],
          ),
          Positioned(
              left: 5,
              bottom: -28,
              child: BorderedText(
                strokeWidth: 5,
                strokeColor: kWhiteColor,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      fontSize: 100,
                      decoration: TextDecoration.none,
                      color: kBlackColor,
                      fontWeight: FontWeight.w900,
                      fontFamily: GoogleFonts.anton().fontFamily),
                ),
              ))
        ],
      ),
    );
  }
}
