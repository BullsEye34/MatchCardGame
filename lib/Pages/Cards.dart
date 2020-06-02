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
          ],
        ));
  }
}
