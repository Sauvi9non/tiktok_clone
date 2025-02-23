//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_configuration/video_config.dart';
//import 'package:tiktok_clone/firebase_options.dart';
import 'constants/sizes.dart';
import 'router.dart';

void main() {
  // async {
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => videoConfig,
      child: MaterialApp.router(
        routerConfig: router,
        title: "Tiktok Clone",
        themeMode: ThemeMode.system,
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          textTheme: Typography.blackCupertino, //GoogleFonts.exo2TextTheme(),
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(0xFFE9435A),
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade50,
          ),
        ),
        darkTheme: ThemeData(
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          textTheme: Typography.whiteCupertino, //GoogleFonts.exo2TextTheme(
          //ThemeData(brightness: Brightness.dark).textTheme,
          //),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Color(0xFFE9435A),
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black87,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}
