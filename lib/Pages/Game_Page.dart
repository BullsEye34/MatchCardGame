import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:card/Store/Card/Game.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.builder(
              shrinkWrap: true,
              itemCount: 16,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                game.card.shuffle();
                return InkWell(
                  onTap: game.turn,
                  child: Card(
                    child: new GridTile(
                      footer: new Text("Footer"),
                      child: Observer(
                        builder: (_) => new Text("${game.card}"),
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
