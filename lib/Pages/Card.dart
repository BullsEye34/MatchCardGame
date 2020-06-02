import 'package:flutter/material.dart';

class Card extends StatefulWidget {
  var shape;
  Card(this.shape);
  @override
  _CardState createState() => _CardState(shape);
}

class _CardState extends State<Card> {
  var shape;
  _CardState(this.shape);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
