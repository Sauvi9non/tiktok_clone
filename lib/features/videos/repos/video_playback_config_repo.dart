//데이터 유지 읽기에 대한 것만 수행하는 위젯
import 'package:shared_preferences/shared_preferences.dart';

class VideoPlaybackConfigRepo {
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";
  //디스크에 데이터 읽고 저장
  final SharedPreferences _preferences;

  VideoPlaybackConfigRepo(this._preferences);

  //음소거 데이터 디스크에 저장
  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  //자동 재생 데이터 디스크에 저장
  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  //음소거 데이터 읽기
  bool isMuted() {
    return _preferences.getBool(_muted) ?? false;
  }

  //자동 재생 데이터 읽기
  bool isAutoplay() {
    return _preferences.getBool(_autoplay) ?? false;
  }
}
