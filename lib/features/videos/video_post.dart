import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../constants/sizes.dart';

class VideoPost extends StatefulWidget {
  final Function
      onVideoFinished; //react 상태 마냥 이렇게 해야 onVideoFinished를 받을 수 있는건가
  final int index;
  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final Duration _animatedDuration = Duration(milliseconds: 150);
  bool _isPaused = false;

  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        //영상의 길이가 현재 영상 내의 위치와 같은지
        widget.onVideoFinished(); //그렇다는 건 영상이 끝났다는 뜻이니까
      }
    }
  }

  void _initVideoPlayer() async {
    // listener 추가가능
    await _videoPlayerController.setVolume(0); //웹에서
    _videoPlayerController.initialize(); //초기화
    setState(() {});
    _videoPlayerController.addListener(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound:
          1.0, //일반적으로 애니메이션은 lowerBound에서 시작 물론 upperBound에서 시작하게 할 수 도 있다.
      upperBound: 1.5,
      value: 1.5, //기본적
      duration: _animatedDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    //사용자가 다른 화면으로 간 경우 재생 안함
    if (info.visibleFraction == 0 && _videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    //animationController 값 변할때마다 실행된다.
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child, // AnimatedOpacity 넘겨주기 위함
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animatedDuration,
                    child: FaIcon(
                      FontAwesomeIcons.circlePlay,
                      color: Colors.white,
                      size: Sizes.size96,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
