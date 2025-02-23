import 'package:flutter/widgets.dart';

class VideoConfigData extends InheritedWidget {
  const VideoConfigData({
    super.key,
    required super.child,
    required this.autoMute,
    required this.toggleMuted,
  });

  final bool autoMute;
  final void Function() toggleMuted;

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //rebuild 할 말
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  final Widget child;
  const VideoConfig({super.key, required this.child});

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = true;

  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
        toggleMuted: toggleMuted, autoMute: autoMute, child: widget.child);
  }
}
