import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/downloads/widgets/buttons.dart';
import 'package:netflix_clone/presentation/downloads/widgets/image_with_circle.dart';

import '../widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final widgetList = [const _SmartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: WidgetAppBar(appBarName: 'Downloads')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: widgetList.length,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
