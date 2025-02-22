import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/onboadring/tutorial_screen.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../onboadring/interests.dart';
import 'widgets/interest_chip.dart';

class InterestsScreen extends StatefulWidget {
  static const String routeName = "interests";
  static const String routeURL = "/tutorial";
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 120) {
      if (_showTitle) return; //setState 계속 호출되는 걸 방지하기 위해
      setState(() {
        _showTitle = true;
      });
    } else {
      if (!_showTitle) return;
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onTapPressed() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => TutorialScreen(),
    //   ),
    // );
    Navigator.push(
        //여기는 stateful이라서 .of(context)로 context를 받아오지 않아도 ok
        context,
        MaterialPageRoute(builder: (context) => TutorialScreen()));
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: Duration(milliseconds: 300),
          child: Text(
            "Choose your interests",
            style: TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gaps.v60,
                Wrap(
                  runSpacing: 15,
                  spacing: 20,
                  children: [
                    for (var interest in Interests.interests)
                      InterestChip(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
          child: GestureDetector(
            onTap: _onTapPressed,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Sizes.size12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text("Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
