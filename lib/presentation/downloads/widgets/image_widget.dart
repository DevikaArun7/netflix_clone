import 'dart:math';

import 'package:flutter/material.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.image,
    this.angle = 0,
    required this.margin,
    required this.sideWidth,
    required this.sideHeight,
  });

  final String image;
  final double angle;
  final EdgeInsets margin;
  final double sideWidth;
  final double sideHeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        // width: size.width * .4,
        width: size.width * sideWidth,
        height: size.width * sideHeight,
        // height: size.width * .5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
      ),
    );
  }
}
