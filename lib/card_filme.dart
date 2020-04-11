import 'package:admob_flutter_example/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardFilme extends StatelessWidget {
  CardFilme(this.link, this.nome, this.thumb);

  final link;
  final nome;
  final thumb;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayer(
                      link: link,
                    )));
      },
      child: SizedBox(
        height: 300,
        child: Card(
          clipBehavior: Clip.antiAlias,
          semanticContainer: false,
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                child: Image.network(
                  thumb,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: Text(
                  'DUB - 720',
                  style: TextStyle(color: Colors.red),
                ),
                top: 0,
                left: 2,
              ),
              Positioned(
                child: Container(
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      nome,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                bottom: 0,
                left: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

}

