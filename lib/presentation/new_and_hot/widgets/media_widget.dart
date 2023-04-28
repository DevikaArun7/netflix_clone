import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class WidgetMediaNewHot extends StatelessWidget {
  const WidgetMediaNewHot({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            image,
            loadingBuilder: (context, child, loadingProgress) {
            return child;
          },
          errorBuilder: (context, error, stackTrace) {
            if(stackTrace == null){
              return Center(child: Icon(Icons.wifi_off_rounded,color: Colors.white,));
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.volume_off,
                  size: 20,
                  color: kWhiteColor,
                )),
          ),
        ),
      ],
    );
  }
}
