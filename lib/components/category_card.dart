import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    required this.icon,
    required this.onPressed,
    required this.fillColor,
    required this.height,
    required this.width,
  });

  final IconData icon;
  final Function onPressed;
  final double height;
  final double width;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: width,
        height: height,
      ),
      shape: CircleBorder(),
      fillColor: fillColor,
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    required this.color,
    required this.assetImage,
    required this.categoryTitle,
    required this.fontSize,
    required this.cardWidth,
    required this.cardHeigth,
  });

  final AssetImage assetImage;
  final double fontSize;
  final String categoryTitle;
  final Color color;
  final double cardWidth;
  final double cardHeigth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        width: 180.0,
        height: 180.0,
        child: Container(
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
        margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
