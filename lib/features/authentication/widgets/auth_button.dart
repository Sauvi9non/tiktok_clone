import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';

import '../../../constants/sizes.dart';

enum Flag { signup, login }

class AuthButton extends StatelessWidget {
  final String text;
  final IconData btnIcon;

  const AuthButton({super.key, required this.text, required this.btnIcon});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size16,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey.withAlpha(100),
          width: Sizes.size1,
        )),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: FaIcon(btnIcon)),
            Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
