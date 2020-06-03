import 'package:flutter/material.dart';

class BlankCard extends StatefulWidget {
  @override
  _BlankCardState createState() => _BlankCardState();
}

class _BlankCardState extends State<BlankCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
