import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tiktok Clone",
      theme: ThemeData(
        primaryColor: Color(0xFFE9435A),
      ),
      home: SignUpScreen(),
    );
  }
}
