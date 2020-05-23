import 'package:admob_flutter/admob_flutter.dart';

class AdMob {
  AdmobReward rewardAd;

  AdMob() {
    rewardAd = AdmobReward(
      //TODO CHAVE DO ADMOB REWARD PRODUCAO
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) rewardAd.load();
        handleEvent(event, args, 'reward');
      },
    );
  }

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
        print('VIDEO COMPESADO');
        break;
      case AdmobAdEvent.completed:
        print('VIDEO COMPLETED');
        break;
      default:
    }
  }

  void dispose() {
    rewardAd.dispose();
  }
}
