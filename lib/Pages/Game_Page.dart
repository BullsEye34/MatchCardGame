import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var card = [
    's2',
    'sA',
    'h2',
    'hA',
    'd2',
    'dA',
    'c2',
    'cA',
  ];
  var card1 = [
    's2',
    'sA',
    'h2',
    'hA',
    'd2',
    'dA',
    'c2',
    'cA',
  ];
  bool reveal = true;

  void turn() {
    reveal = !reveal;
  }

  @override
  Widget build(BuildContext context) {
    var shuffleCard = card1;
    shuffleCard.shuffle();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.png'),
            ),
          ),
          child: Padding(
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
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      "0:00",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ],
                ),
                Spacer(),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: card.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: turn,
                        child: (reveal)
                            ? Card(
                                child: new GridTile(
                                  child: Observer(
                                    builder: (_) => Center(
                                        child: new Text("${card[index]}")),
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
                    itemCount: card.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: turn,
                        child: Card(
                          child: new GridTile(
                            child: Observer(
                              builder: (_) => Center(
                                  child: new Text("${shuffleCard[index]}")),
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
