import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/widgets/email_screen.dart';

import '../../../constants/sizes.dart';
import 'form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = ""; //

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose(); //마지막에 아무래도 얘가 부모그거니까...
  }

  void _onNextTap() {
    if (_username.isEmpty) {
      return;
    } else {
      Navigator.of(context).push(
        //왜 여기서는 매개변수로 BuildContext context를 안받아도 되나?
        MaterialPageRoute(
          //왜냐면 StatefulWidget안에 있다면 어디서든 context를 사용할 수 있기 때문
          builder: (context) => const EmailScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.white,
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            Text(
              "You can always change this later",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Username", //placeholder
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
                onTap: _onNextTap,
                child: FormButton(disabled: _username.isEmpty)),
          ],
        ),
      ),
    );
  }
}
