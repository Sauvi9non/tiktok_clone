import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';

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
              "Create username",
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            Text(
              "You can always change this laster",
              style: TextStyle(
                color: Colors.black54,
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
            FormButton(disabled: _username.isEmpty),
          ],
        ),
      ),
    );
  }
}

class FormButton extends StatelessWidget {
  // const FormButton({
  //   super.key,
  //   required String username, //여기 username은 부모에게서 받은
  // }) : _username = username; // _username은 여기서 쓸거

  // final String _username; //그런데 어차피 FormButton에서는 username의 유무만 궁굼한거니까.

  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size10),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: Duration(milliseconds: 500),
          child: Text(
            "Next",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
