import 'package:flutter/material.dart';

class CardFilme extends StatelessWidget {
  CardFilme(this.link, this.nome, this.thumb);

  final link;
  final nome;
  final thumb;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
//        //navigator para o video
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => VideoPlayer(
//                      link: link,
//                    )));
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
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        nome,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
