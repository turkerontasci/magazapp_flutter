import 'package:flutter/material.dart';
import 'package:magazapp_flutter/category_pages/accessories.dart';
import 'package:magazapp_flutter/category_pages/electronics.dart';
import 'package:magazapp_flutter/category_pages/home_design.dart';
import 'package:magazapp_flutter/category_pages/mens_wear.dart';
import 'package:magazapp_flutter/category_pages/personal_care.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/products/categories.dart';
import 'package:magazapp_flutter/products/category_product.dart';
import 'package:magazapp_flutter/category_pages/womens_wear.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

final double fontSize = 20.0;
final double cardWidth = 175.0;
final double cardHeigth = 175.0;

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(10.0),
            childAspectRatio: 9.0 / 10.0,
            children: List.generate(categories.length, (index) => CategoryCard(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => categories[index]["category_route"],
                  ),
                );
              },
              fontSize: fontSize,
              cardWidth: cardWidth,
              cardHeigth: cardHeigth,
              categoryTitle: "${categories[index]["title"]}",
              assetImage: AssetImage(categories[index]["image"]),
            ),),
          ),
        ),
      ),
    );
  }
}
