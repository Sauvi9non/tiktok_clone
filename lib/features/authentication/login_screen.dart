import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

import '../../constants/sizes.dart';
import 'widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text("Login to for TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  )),
              Gaps.v20,
              Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: Sizes.size16, color: Colors.black45)),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailLoginTap(
                    context), //stateless Widget이니까 context 전달, 왜냐면 stateless가 이 메서드는 context에 접근 못해서
                child: AuthButton(
                  text: "Use email & password",
                  btnIcon: FontAwesomeIcons.solidUser,
                ),
              ),
              Gaps.v10,
              GestureDetector(
                child: AuthButton(
                  text: "Continue with Apple",
                  btnIcon: FontAwesomeIcons.apple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
