import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.color,
      this.cardChild,
      this.onPress,
      this.cardWidth,
      this.cardHeigth});

  final Color color;
  final Widget cardChild;
  final Function onPress;
  final double cardWidth;
  final double cardHeigth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: cardWidth,
        height: cardHeigth,
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
