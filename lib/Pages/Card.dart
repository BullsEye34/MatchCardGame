import 'package:flutter/material.dart';

class Card extends StatefulWidget {
  var shape;
  var num;
  Card(this.shape, this.num);
  @override
  _CardState createState() => _CardState(shape, num);
}

class _CardState extends State<Card> {
  var shape;
  var num;
  _CardState(this.shape, this.num);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 62,
      color: Colors.white,
    );
  }
}
