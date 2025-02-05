import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4; //default
  final PageController _pageController = PageController();

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.amber, //까지 count가 왔을 때 페이지를 추가
    Colors.teal,
  ];

  void _onPageChanged(int page) {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
    if (page == _itemCount - 1) {
//        마지막 페이지가 되면
      _itemCount = _itemCount + 4; //colors가 무한 반복되는 것처럼...
      colors.addAll([
        //addAll 한 리스트에 있는 모든항목을 다른 리스트에 추가해줌
        Colors.blue,
        Colors.red,
        Colors.amber, //까지 count가 왔을 때 페이지를 추가
        Colors.teal,
      ]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
