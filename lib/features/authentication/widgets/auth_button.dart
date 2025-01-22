import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/username_screen.dart';

import '../../../constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final IconData btnIcon;

  const AuthButton({super.key, required this.text, required this.btnIcon});

  void _onButtonTap(BuildContext context) {
    switch (text) {
      case "Log in":
        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => LoginScreen()));
        break;
      case "Sign up":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
        break;
      case "Use email & password":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UsernameScreen()));
        break;
      case "Continue with Apple":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UsernameScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonTap(context),
      child: FractionallySizedBox(
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
      ),
    );
  }
}
