import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constants.dart';
import '../../../home/widgets/custom_button.dart';
import '../../widgets/media_widget.dart';

class WidgetComingSoonContent extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const WidgetComingSoonContent({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        kHeight,
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 420,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Text(
                    month,
                    style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kGreyColor),
                  ),
                  Text(
                    day,
                    style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 420,
              width: screenSize.width - 50,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   WidgetMediaNewHot(image: posterPath),
                  kHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                                  GoogleFonts.permanentMarker().fontFamily),
                        ),
                      ),
                      Row(
                        children: [
                          customButtonWidget(
                              icon: CupertinoIcons.bell,
                              title: 'Remaind me',
                              iconSize: 20,
                              textSize: 10),
                          kWidth,
                          customButtonWidget(
                              icon: CupertinoIcons.info,
                              title: 'Info',
                              iconSize: 20,
                              textSize: 10),
                          kWidth
                        ],
                      ) //Delicious Handrawn
                    ],
                  ),
                  kHeight,
                   Text('Coming on $day $month'),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/128/5977/5977590.png',
                    width: 30,
                  ),
                   Text(
                    movieName,
                    style:const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  kHeight,
                   Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(color: kGreyColor),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
