import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

import '../../constants/sizes.dart';
import 'widgets/tutorial_child_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      //to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      //to the left
      _direction = Direction.left;
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 유저가 왼쪽으로 넘기는지 오른쪽인지 알수있다.
      //화면을 넘기는 swipe를 gesturedectector는 pan이라고 한다.
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: TutorialChildScreen(
                  title: "Watch cool videos!",
                  caption:
                      "Videos are personalized for you based on what you watch, like, and share."),
              secondChild: TutorialChildScreen(
                  title: "Follow the app!",
                  caption: "blahblahblahblahblahblah"),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState
                      .showSecond, //firstChild와 secondeChilde 중 뭘 보여줄지
              duration: Duration(
                milliseconds: 300,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: AnimatedOpacity(
            opacity: _showingPage == Page.first ? 0 : 1,
            duration: Duration(
              milliseconds: 300,
            ),
            child: CupertinoButton(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size12,
                  horizontal: Sizes.size24,
                ),
                color: Theme.of(context).primaryColor,
                onPressed: _onEnterAppTap,
                child: Text(
                  "Enter the app!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
