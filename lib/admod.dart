import 'package:admob_flutter/admob_flutter.dart';

class AdMob {

  AdmobReward _rewardAd;

  AdMob() {
    _rewardAd = AdmobReward(
      //TODO CHAVE DO ADMOB REWARD PRODUCAO
      adUnitId: 'ca-app-pub-1162287445258667/4324295495',
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) _rewardAd.load();
        handleEvent(event, args, 'reward');
      },
    );
  }

  get reward => _rewardAd;

  //retorno do admob
  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        print('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        print('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        print('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        print('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        print('Admob $adType VIDEO COMPESADO');
        break;
      case AdmobAdEvent.completed:
        print('Admob $adType VIDEO COMPLETED');
        break;
      default:
    }
  }

  void dispose() {
    _rewardAd.dispose();
  }
}
