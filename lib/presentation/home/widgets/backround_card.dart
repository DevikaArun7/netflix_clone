import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'custom_button.dart';

class WidgetBackgroundCard extends StatelessWidget {
  const WidgetBackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(kMainImage))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customButtonWidget(icon: Icons.add, title: 'My List'),
              _playButton(),
              customButtonWidget(icon: Icons.info, title: 'Info')
            ],
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
    );
  }
}
