import 'package:flutter/material.dart';
import 'package:tiktok_clone/utils.dart';
import '../../../constants/sizes.dart';

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
          color: disabled
              ? isDarkMode(context)
                  ? Colors.grey.shade800
                  : Colors.grey.shade300
              : Theme.of(context).primaryColor,
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
