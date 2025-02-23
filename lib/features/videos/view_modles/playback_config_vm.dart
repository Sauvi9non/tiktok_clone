import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  //<>에 화면이 expose하기 원하는 형태를 넣는다. model은 곧 데이터의 형태를 뜻하니까 model을 넣는다
  final VideoPlaybackConfigRepo _repository; //레포

  PlaybackConfigViewModel(this._repository); //생성자

  void setMuted(bool value) {
    //view에게 이거 expose해주기
    _repository.setMuted(value);
    state = PlaybackConfigModel(muted: value, autoplay: state.autoplay);
    //state를 직접 조작하는 대신 모델을 새로 만든다.
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(muted: state.muted, autoplay: value);
  }

  @override
  build() {
    //화면이 보기를 원하는 데이터의 초기 상태를 반환해야 함.
    return PlaybackConfigModel(
      //여기서 모델 초기화
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    ); //이 데이터에 접근하는 방법은 state 사용해서
  }
}

final playbackConfigProvider = //vm의 데이터 변화 통지
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
        () => throw UnimplementedError());
