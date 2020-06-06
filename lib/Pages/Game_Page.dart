import 'dart:async';

import 'package:card/Pages/BlankCard.dart';
import 'package:card/Pages/Cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  var newCards = [
    {"card": "s1", "reveal": false, "matched": false},
    {"card": "sA", "reveal": false, "matched": false},
    {"card": "c1", "reveal": false, "matched": false},
    {"card": "cA", "reveal": false, "matched": false},
    {"card": "d1", "reveal": false, "matched": false},
    {"card": "dA", "reveal": false, "matched": false},
    {"card": "h1", "reveal": false, "matched": false},
    {"card": "hA", "reveal": false, "matched": false},
    {"card": "s1", "reveal": false, "matched": false},
    {"card": "sA", "reveal": false, "matched": false},
    {"card": "c1", "reveal": false, "matched": false},
    {"card": "cA", "reveal": false, "matched": false},
    {"card": "d1", "reveal": false, "matched": false},
    {"card": "dA", "reveal": false, "matched": false},
    {"card": "h1", "reveal": false, "matched": false},
    {"card": "hA", "reveal": false, "matched": false},
  ];
  bool reveal = true;
  var buffer = "";
  var buffern = -999;
  var yaay = "IDK";
  turn(index) {
    setState(() {
      newCards[index]["reveal"] = !newCards[index]["reveal"];
    });
    print(newCards[index]["reveal"]);
    if (newCards[index]["reveal"] ==
        true) if (buffer == newCards[index]["card"] && buffern != index) {
      setState(() {
        newCards[index]["matched"] = true;
        newCards[buffern]["matched"] = true;
        buffern = -999;
        buffer = "";
        yaay = "true";
        Timer(Duration(milliseconds: 50), () {
          yaay = "IDK";
        });
      });
    } else if (buffer != newCards[index]["card"] &&
        buffern != -999 &&
        buffern != index) {
      Timer(Duration(milliseconds: 1000), () {
        setState(() {
          newCards[index]["reveal"] = !newCards[index]["reveal"];
          newCards[buffern]["reveal"] = !newCards[buffern]["reveal"];
          buffer = "";
          buffern = -999;
        });
      });
    }

    if (newCards[index]["reveal"]) if (buffer == "") {
      setState(() {
        buffer = newCards[index]["card"];
        buffern = index;
      });
    }
    if (!newCards[index]["reveal"]) buffer = "";
    print(buffer);
  }

  AnimationController flipControllet;
  Animation flipAnimation;
  AnimationStatus flipStatus = AnimationStatus.dismissed;

  @override
  Widget build(BuildContext context) {
    print(buffer);
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newCards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () => turn(index),
                        child: (newCards[index]["matched"])
                            ? BlankCard()
                            : (newCards[index]["reveal"])
                                ? new Cards(
                                    newCards[index]["card"].toString()[0],
                                    newCards[index]["card"]
                                        .toString()
                                        .substring(1))
                                : Container(
                                    child: Image.asset('assets/card.png'),
                                  ));
                  },
                ),
                /* GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
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
                    }), */
                Spacer(),
                (yaay == "true")
                    ? right()
                    : (yaay == "IDK")
                        ? Container(
                            height: 100,
                            width: 100,
                          )
                        : wrong(),
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
