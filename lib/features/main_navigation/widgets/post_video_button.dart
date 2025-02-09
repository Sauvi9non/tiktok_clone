import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  final int selectedIndex;

  const PostVideoButton({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 18,
          child: Container(
            height: 30,
            width: 25,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Positioned(
          left: 18,
          child: Container(
            height: 30,
            width: 25,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size11,
          ),
          decoration: BoxDecoration(
            color: selectedIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
          ),
          height: 30,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: selectedIndex == 0 ? Colors.black : Colors.white,
              size: Sizes.size18,
            ),
          ),
        ),
      ],
    );
  }
}
