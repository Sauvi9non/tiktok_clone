import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4; //default
  final Duration _scrollDuration = Duration(milliseconds: 300);
  final Curve _scrollCurve = Curves.linear;
  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    _pageController.animateToPage(0,
        duration: _scrollDuration, curve: _scrollCurve);
    if (page == _itemCount - 1) {
//        마지막 페이지가 되면
      _itemCount = _itemCount + 4; //colors가 무한 반복되는 것처럼...
    }
    setState(() {});
  }

  void _onVideoFinished() {
    //를 VideoPost에 넘긴다
    //영상이 끝날 때 사용자를 다음화면으로 넘기는 애니메이션
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index));
    //StatefulWidget에게 넘겨주는 거지 State에게 가는게 아님
    //그래서 VideoPost에서 property를 만들고, 생성자에도 넣어준다
  }
}
