import 'package:flutter/widgets.dart';

class VideoConfig extends ChangeNotifier {
  //expose data
  bool autoMute = true;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();
