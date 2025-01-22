import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';
import 'form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "What's your email?",
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  hintText: "Email", //placeholder
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
            FormButton(disabled: _username.isEmpty),
          ],
        ),
      ),
    );
  }
}
