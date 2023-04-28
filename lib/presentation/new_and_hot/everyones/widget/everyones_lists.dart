import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constants.dart';
import '../../../home/widgets/custom_button.dart';
import '../../widgets/media_widget.dart';

class WidgetEveryounesMedia extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const WidgetEveryounesMedia({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        kHeight,
         Text(
          movieName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight,
         Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: kGreyColor),
        ),
        kHeight50,
         WidgetMediaNewHot(image: posterPath,),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(),
            const Spacer(),
            customButtonWidget(
                icon: Icons.send_outlined,
                title: 'Share',
                textSize: 10,
                iconSize: 30),
            kWidth,
            customButtonWidget(
                icon: Icons.add, title: 'My List', textSize: 10, iconSize: 30),
            kWidth,
            customButtonWidget(
                icon: Icons.play_arrow_rounded,
                title: 'Play',
                textSize: 10,
                iconSize: 30),
            kWidth
          ],
        ),
        Image.network(
          'https://cdn-icons-png.flaticon.com/128/5977/5977590.png',
          width: 30,
        ),
      ]),
    );
  }
}
