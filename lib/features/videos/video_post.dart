import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final Function
      onVideoFinished; //react 상태 마냥 이렇게 해야 onVideoFinished를 받을 수 있는건가
  const VideoPost({super.key, required this.onVideoFinished});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

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
    _videoPlayerController.play(); //재생
    setState(() {});
    _videoPlayerController.addListener(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.black,
                ),
        ),
      ],
    );
  }
}
