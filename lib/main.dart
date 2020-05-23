import 'dart:developer';
import 'dart:io';

import 'package:admob_flutter_example/card_filme.dart';
import 'package:admob_flutter_example/lista.dart';
import 'package:admob_flutter_example/video_player.dart';
import 'package:flutter/material.dart';

import 'package:admob_flutter/admob_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO MINHA CHAVE ADMOB PRODUCAO
  Admob.initialize('ca-app-pub-3940256099942544~3347511713');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobReward rewardAd;

  @override
  void initState() {
    super.initState();

//    rewardAd = AdmobReward(
//      //TODO CHAVE DO ADMOB REWARD PRODUCAO
//      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
//      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
//        if (event == AdmobAdEvent.closed) rewardAd.load();
//        handleEvent(event, args, 'reward');
//      },
//    );
//
//    rewardAd.load();
  }

  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(milliseconds: 1500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: const Text('WHAT! MOVIE'),
        ),
        bottomNavigationBar: Builder(
          builder: (BuildContext context) {
            return Container(
              color: Colors.blueGrey,
              child: SafeArea(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(''),
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Text(
                            'Show Reward',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (await rewardAd.isLoaded) {
                              rewardAd.show();
                            } else {
                              showSnackBar("Reward ad is still loading...");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 200,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('WHAT VIDEO'),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Pesquisa',
                onPressed: () {
                  /* ... */
                },
              ),
            ]),
        SliverGrid.count(
            childAspectRatio: 0.65,
            children: List.generate(
                Teste.list.length,
                (index) => Center(
                      child: InkWell(
                        onTap: ()async{
                          if (await rewardAd.isLoaded) {
                            await rewardAd.show();

                            VideoPlayer(
                              link: Teste.list[index][0],
                            );

                          }
                        },
                        child: CardFilme(Teste.list[index][0],
                            Teste.list[index][2], Teste.list[index][1]),
                      ),
                    )),
            crossAxisCount: 3),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 100,
                width: 100,
                child: Center(
                  child: Text('Categorias'),
                ),
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ],
    );
  }

//  //retorno do admob
//  void handleEvent(
//      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
//    switch (event) {
//      case AdmobAdEvent.loaded:
//        showSnackBar('New Admob $adType Ad loaded!');
//        break;
//      case AdmobAdEvent.opened:
//        showSnackBar('Admob $adType Ad opened!');
//        break;
//      case AdmobAdEvent.closed:
//        showSnackBar('Admob $adType Ad closed!');
//        break;
//      case AdmobAdEvent.failedToLoad:
//        showSnackBar('Admob $adType failed to load. :(');
//        break;
//      case AdmobAdEvent.rewarded:
//        print('VIDEO COMPESADO');
//        break;
//      case AdmobAdEvent.completed:
//        print('VIDEO COMPLETED');
//        showSnackBar('FELIZ');
//        break;
//      default:
//    }
//
//    @override
//    void dispose() {
//      rewardAd.dispose();
//      super.dispose();
//    }
//  }
}
