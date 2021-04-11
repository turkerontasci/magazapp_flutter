import 'reusable_card.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    @required this.assetImage,
    this.categoryTitle,
    this.cardHeigth,
    this.cardWidth,
    this.fontSize,
    this.onPress,
  });

  final AssetImage assetImage;
  final String categoryTitle;
  final double cardHeigth;
  final double cardWidth;
  final double fontSize;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      onPress: onPress,
      cardHeigth: cardHeigth,
      cardWidth: cardWidth,
      cardChild: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(image: assetImage, fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                "$categoryTitle",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
