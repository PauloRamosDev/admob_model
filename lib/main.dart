import 'package:admob_flutter/admob_flutter.dart';
import 'package:admob_flutter_example/admod.dart';
import 'package:admob_flutter_example/card_filme.dart';
import 'package:admob_flutter_example/lista.dart';
import 'package:admob_flutter_example/video_player.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO CHAVE ADMOB PRODUCAO A MESMA DO ARQUIVO MANIFEST
  Admob.initialize('ca-app-pub-1162287445258667~1596144086');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdMob admob;

  @override
  void initState() {
    super.initState();
    //TODO init admob
    admob = AdMob();
  }

  @override
  void dispose() {

    //TODO dispose no admob
    admob.dispose();
    super.dispose();
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
//        appBar: AppBar(
//          title: const Text('WHAT! MOVIE'),
//        ),
        bottomNavigationBar: _bottom(),
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
              title: Text('WHAT! VIDEO'),
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
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //TODO chamar admobbaner
              AdmobBanner(
                  adUnitId: AdMob.admobBannerId, adSize: AdmobBannerSize.BANNER)
            ],
          ),
        ),
        SliverGrid.count(
            childAspectRatio: 0.65,
            children: List.generate(
                Teste.list.length,
                (index) => Center(
                      child: InkWell(
                        onTap: () async {
                          VideoPlayer(
                            link: Teste.list[index][0],
                          );
                        },
                        child: CardFilme(Teste.list[index][0],
                            Teste.list[index][2], Teste.list[index][1]),
                      ),
                    )),
            crossAxisCount: 3),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //TODO chamar admobbaner
              AdmobBanner(
                  adUnitId: AdMob.admobBannerId,
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE)
            ],
          ),
        ),
      ],
    );
  }

  _bottom() {
    return Builder(
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
                        'SHOW TESTE ADMOB',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        //TODO Vai tentar abrir o admobReward se ja tiver um carregado, se nao ele mostra um interstitital

                        if (await admob.reward.isLoaded) {
                          //Chamar admob
                          admob.reward.show();
                        } else {
                          //Chamar admob
                          admob.interstitial.show();
                          showSnackBar("admob Reward está sendo carregado...");
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
    );
  }
}
