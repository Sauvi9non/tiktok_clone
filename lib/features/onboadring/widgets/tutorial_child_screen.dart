import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class TutorialChildScreen extends StatelessWidget {
  final String title, caption;
  const TutorialChildScreen({
    super.key,
    required this.title,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v80,
        Text(
          title,
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          caption,
          style: TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
