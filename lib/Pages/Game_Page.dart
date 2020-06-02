import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var newCards = [
    {"card": "s1", "reveal": false},
    {"card": "sA", "reveal": false},
    {"card": "c1", "reveal": false},
    {"card": "cA", "reveal": false},
    {"card": "d1", "reveal": false},
    {"card": "dA", "reveal": false},
    {"card": "h1", "reveal": false},
    {"card": "hA", "reveal": false}
  ];
  bool reveal = true;

  turn(index) {
    setState(() {
      newCards[index]["reveal"] = !newCards[index]["reveal"];
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xff7A0200),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xff7A0200),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back.png'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Round 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Comfortaa'),
                      ),
                      Text(
                        "0:00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Comfortaa'),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: newCards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => turn(index),
                          child: (newCards[index]["reveal"])
                              ? Card(
                                  child: new GridTile(
                                    child: Observer(
                                      builder: (_) => Center(
                                          child: new Text(
                                              "${newCards[index]["card"]}")),
                                    ), //just for testing, will fill with image later
                                  ),
                                )
                              : /* Card(
                                child: new GridTile(
                                  child: Observer(
                                    builder: (_) => Center(child: new Text("")),
                                  ), //just for testing, will fill with image later
                                ),
                              ), */
                              Container(
                                  child: Image.asset('assets/card.png'),
                                ));
                    }),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: newCards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => turn(index),
                          child: (newCards[index]["reveal"])
                              ? Card(
                                  child: new GridTile(
                                    child: Observer(
                                      builder: (_) => Center(
                                          child: new Text(
                                              "${newCards[index]["card"]}")),
                                    ), //just for testing, will fill with image later
                                  ),
                                )
                              : InkWell(
                                  onTap: () => turn(index),
                                  child: Container(
                                    child: Image.asset('assets/card.png'),
                                  ),
                                ));
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
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'Comfortaa'),
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
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'Comfortaa'),
        )
      ],
    );
  }
}
