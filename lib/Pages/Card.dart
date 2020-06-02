import 'package:flutter/material.dart';

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
    return Container(
      height: 96,
      width: 2,
      color: Colors.black,
    );
  }
}
