import 'package:flutter/cupertino.dart';
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
  final TextEditingController _birthdayController = TextEditingController();
  DateTime initialDate = DateTime.now();

  int initialYear =
      int.parse(DateTime.now().toString().split(" ").first.substring(0, 4));
  int initialMonth =
      int.parse(DateTime.now().toString().split(" ").first.substring(5, 7));
  int initialDay =
      int.parse(DateTime.now().toString().split(" ").first.substring(8, 10));

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
  }

  void _onScaffoldTap() {
    //유저가 스캐폴드의 아무곳이나 누르면 Birthday screen이 focus를 잃는다
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    // if () return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BirthdayScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
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
          padding: EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "When's your Birthday?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v8,
              Text(
                "Your birthday won't be shown publicly",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _birthdayController,
                enabled: false,
                autocorrect: false,
                onEditingComplete: _onSubmit,
              ),
              Gaps.v10,
              GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: true,
                  )), //이거 색만 바뀌는거 아닌가
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime:
                DateTime(initialYear - 12, initialMonth, initialDay),
            mode: CupertinoDatePickerMode.date,
            backgroundColor: Colors.white,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
