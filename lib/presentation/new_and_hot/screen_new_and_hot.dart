import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/coming_soon/coming_soon_screen.dart';
import 'package:netflix_clone/presentation/new_and_hot/everyones/everyones_screen.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                'New & Hot',
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  size: 30,
                  color: Colors.white,
                ),
                Container(
                  color: Colors.blue,
                  width: 30,
                  height: 30,
                ),
              ],
              bottom: TabBar(
                  labelColor: kBlackColor,
                  unselectedLabelColor: kWhiteColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kWhiteColor, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming soon',
                    ),
                    Tab(
                      text: '👀 Everyones Watching',
                    )
                  ])),
          body: const TabBarView(children: [
            WidgetBuildComingSoon(key: Key('coming_soon')),
            WidgetBuildEveriyone(key: Key('everyone_is_watching'),),
          ])),
    );
  }
}
