import 'package:flutter/cupertino.dart';
import '../../core/constants.dart';

class MainCardForHome extends StatelessWidget {
  final String imageUrl;
  const MainCardForHome({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 170,
        // height: 230,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageUrl
                ))),
      ),
    );
  }
}
