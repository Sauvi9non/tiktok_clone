import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';
import 'widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreen();
}

class _PasswordScreen extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = ""; //

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose(); //마지막에 아무래도 얘가 부모그거니까...
  }

  String? _isPasswordValid() {
    if (_password.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_password)) {
      return "Not Valid password";
    }
    return null;
  }

  void _onScaffoldTap() {
    //유저가 스캐폴드의 아무곳이나 누르면 password screen이 focus를 잃는다
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_isPasswordValid() != null || _password.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Sign up",
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "What's your password?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                    errorText: _isPasswordValid(),
                    hintText: "Make it strong", //placeholder
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ))),
                cursorColor: Theme.of(context).primaryColor, //커서 색깔
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _password.isEmpty || _isPasswordValid() != null),
              ), //이거 색만 바뀌는거 아닌가
            ],
          ),
        ),
      ),
    );
  }
}
