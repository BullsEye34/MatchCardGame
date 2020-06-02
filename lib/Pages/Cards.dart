import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class Cards extends StatefulWidget {
  var shape;
  var num;
  Cards(this.shape, this.num);
  @override
  _CardsState createState() => _CardsState(shape, num);
}

class _CardsState extends State<Cards> {
  var shape;
  var num;
  _CardsState(this.shape, this.num);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cardFront.png'),
                ),
              ),
            ),
            Center(
              child: (shape == "s")
                  ? Icon(
                      RpgAwesome.spades,
                      size: 40,
                    )
                  : (shape == "c")
                      ? Icon(
                          RpgAwesome.clovers,
                          size: 40,
                        )
                      : (shape == "d")
                          ? Icon(
                              RpgAwesome.diamonds,
                              size: 40,
                              color: Colors.red,
                            )
                          : Icon(
                              RpgAwesome.hearts,
                              size: 40,
                              color: Colors.red,
                            ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        num,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: (shape == "s" || shape == "c")
                                ? Colors.black
                                : Colors.red),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Text(
                        num,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: (shape == "s" || shape == "c")
                                ? Colors.black
                                : Colors.red),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
