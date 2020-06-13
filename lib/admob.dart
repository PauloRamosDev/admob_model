import 'package:admob_flutter/admob_flutter.dart';

/// plugin: admob_flutter: ^0.3.4

class AdMob {
  var currectEvent;

  AdmobReward _rewardAd;
  AdmobInterstitial _admobInterstitial;

  //teste
  static const admobBannerId = 'ca-app-pub-3940256099942544/6300978111';
  static const admobRewardId = 'ca-app-pub-3940256099942544/5224354917';
  static const admobInterstitialId = 'ca-app-pub-3940256099942544/1033173712';

  //produção
//  static const admobBannerId = 'KEY';
//  static const admobRewardId = 'KEY';
//  static const admobInterstitialId = 'KEY';


  AdMob() {
    print('ADMOB INIT');

    _rewardAd = AdmobReward(
      adUnitId: admobRewardId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed || event == AdmobAdEvent.completed) {
          print('CARREGANDO NOVO ADMOB reward');
          reward.load();
        }
        handleEvent(event, args, 'reward');
      },
    );
    _admobInterstitial = AdmobInterstitial(
      adUnitId: admobInterstitialId,
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed || event == AdmobAdEvent.completed) {
          print('CARREGANDO NOVO ADMOB interstitial');
          _admobInterstitial.load();
        }
        handleEvent(event, args, 'interstitial');
      },
    );

    _rewardAd.load();
    _admobInterstitial.load();
  }

  AdmobReward get reward => _rewardAd;

  AdmobInterstitial get interstitial => _admobInterstitial;

  //retorno do admob
  handleEvent(AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    currectEvent = event;
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

    return event;
  }

  void dispose() {
    _rewardAd.dispose();
    _admobInterstitial.dispose();
  }
}
