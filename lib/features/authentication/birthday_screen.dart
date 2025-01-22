import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import '../../../constants/sizes.dart';
import 'widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreen();
}

class _BirthdayScreen extends State<BirthdayScreen> {
  final TextEditingController _BirthdayController = TextEditingController();
  String _birthday = ""; //
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _BirthdayController.addListener(() {
      setState(() {
        _birthday = _BirthdayController.text;
      });
    });
  }

  @override
  void dispose() {
    _BirthdayController.dispose();
    super.dispose(); //마지막에 아무래도 얘가 부모그거니까...
  }

  bool _isBirthdayValid() {
    return _birthday.isNotEmpty && _birthday.length >= 8;
  }

  void _onScaffoldTap() {
    //유저가 스캐폴드의 아무곳이나 누르면 Birthday screen이 focus를 잃는다
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_isBirthdayValid() || _birthday.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _BirthdayController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
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
                "What's your Birthday?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                obscureText: _obscureText,
                controller: _BirthdayController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => _onClearTap(),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h16,
                        GestureDetector(
                          onTap: () => _toggleObscureText(),
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade400,
                            size: Sizes.size20,
                          ),
                        )
                      ],
                    ),
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
              Gaps.v10,
              Text("Your Birthday must have:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isBirthdayValid() ? Colors.green : Colors.grey,
                  ),
                  Gaps.h5,
                  Text(" 8 to 20 characters"),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _birthday.isEmpty || _isBirthdayValid()),
              ), //이거 색만 바뀌는거 아닌가
            ],
          ),
        ),
      ),
    );
  }
}
