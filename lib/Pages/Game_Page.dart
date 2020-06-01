import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:card/Store/Card/Game.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Game game = new Game();
  final Game game2 = new Game();

  @override
  Widget build(BuildContext context) {
    var shuffleCard = game2.card;
    shuffleCard.shuffle();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.builder(
              shrinkWrap: true,
              itemCount: game.card.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: game.turn,
                  child: (game.reveal)
                      ? Card(
                          child: new GridTile(
                            child: Observer(
                              builder: (_) => new Text("${game.card[index]}"),
                            ), //just for testing, will fill with image later
                          ),
                        )
                      : Card(
                          child: new GridTile(
                            child: Observer(
                              builder: (_) => new Text(""),
                            ), //just for testing, will fill with image later
                          ),
                        ),
                );
              }),
          GridView.builder(
              shrinkWrap: true,
              itemCount: game.card.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: game.turn,
                  child: Card(
                    child: new GridTile(
                      child: Observer(
                        builder: (_) => new Text("${shuffleCard[index]}"),
                      ), //just for testing, will fill with image later
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
