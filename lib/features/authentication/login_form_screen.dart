import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); //아 그러네 이러면 controller 안 써도 되는 구만

  Map<String, String> formData =
      {}; //{안에 'email': '값', 'password':'값'} 이렇게 들어오겠지

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      //_formKey.currentState?.validate(); 이렇게도 표현 가능
      if (_formKey.currentState!.validate()) {
        //save
        _formKey.currentState!
            .save(); //save는 모든 텍스트 입력에 onSaved 콜백 함수를 실행하게 된다.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          //global key가 있어야 고유 식별자 역할, 폼의 state에 접근 가능, form 메서드 실행시킬 수 있다.
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                //input
                decoration: InputDecoration(
                  //input의 타입 느낌이랑은 다르지만 아무튼...
                  hintText: 'Email',
                ),
                validator: (value) {
                  return "i don't like your email";
                },
                onSaved: (newValue) => {
                  if (newValue != null) {formData['email'] = newValue}
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  return "wrong password";
                },
                onSaved: (newValue) => {
                  if (newValue != null) {formData['password'] = newValue}
                },
              ),
              Gaps.v48,
              GestureDetector(
                onTap: _onSubmitTap,
                child: FormButton(disabled: false),
              ), //TODO: formbutton 조금 바쒀서 매개변수로 Log in 전달하면 그 글자 log in으로 바뀌게
            ],
          ),
        ),
      ),
    );
  }
}
