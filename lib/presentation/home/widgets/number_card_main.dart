import 'package:flutter/cupertino.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class WidgetNumberCardTop extends StatelessWidget {
  const WidgetNumberCardTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: WidgetMainTitler(title: 'Top 10 TV Shows In India Today'),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => WidgetNumberCard(
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
