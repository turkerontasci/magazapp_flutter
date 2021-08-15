import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/products/categories.dart';

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
            children: List.generate(
              categories.length,
              (index) => CategoryCard(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
