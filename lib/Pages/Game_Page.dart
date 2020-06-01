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
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Round 1",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "0:00",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            GridView.builder(
                shrinkWrap: true,
                itemCount: game.card.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: game.turn,
                    child: (game.reveal)
                        ? Card(
                            child: new GridTile(
                              child: Observer(
                                builder: (_) => Center(
                                    child: new Text("${game.card[index]}")),
                              ), //just for testing, will fill with image later
                            ),
                          )
                        : Card(
                            child: new GridTile(
                              child: Observer(
                                builder: (_) => Center(child: new Text("")),
                              ), //just for testing, will fill with image later
                            ),
                          ),
                  );
                }),
            GridView.builder(
                shrinkWrap: true,
                itemCount: game.card.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: game.turn,
                    child: Card(
                      child: new GridTile(
                        child: Observer(
                          builder: (_) =>
                              Center(child: new Text("${shuffleCard[index]}")),
                        ), //just for testing, will fill with image later
                      ),
                    ),
                  );
                }),
            Spacer(),
            right(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  wrong() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.white,
            child: Center(
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: 60,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Wrong",
          style: TextStyle(color: Colors.white, fontSize: 30),
        )
      ],
    );
  }

  right() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Center(
              child: Icon(
                Icons.check,
                color: Colors.red,
                size: 60,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Match",
          style: TextStyle(color: Colors.white, fontSize: 30),
        )
      ],
    );
  }
}
