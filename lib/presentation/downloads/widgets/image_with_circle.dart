import 'package:flutter/material.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../../core/strings.dart';
import 'image_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImage());
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there's\nalways something on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.3,
                          backgroundColor: Colors.grey[850],
                        ),
                        DownloadsImageWidget(
                          sideHeight: .4,
                          sideWidth: .3,
                          image:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 150, top: 20),
                          angle: 10,
                        ),
                        DownloadsImageWidget(
                          sideHeight: .4,
                          sideWidth: .3,
                          image:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 150, top: 20),
                          angle: -10,
                        ),
                        DownloadsImageWidget(
                          sideHeight: .45,
                          sideWidth: .35,
                          image:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(
                            top: 29,
                          ),
                          // angle: 7,
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}
