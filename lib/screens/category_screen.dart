import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/category_card.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kadın Giyim",
                        assetImage: AssetImage('images/elbise.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Aksesuar",
                        assetImage: AssetImage('images/canta.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Elektronik",
                        assetImage: AssetImage('images/wdblack.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Müzik",
                        assetImage: AssetImage('images/guitar.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Spor",
                        assetImage: AssetImage('images/nike.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Ev - Yaşam",
                        assetImage: AssetImage('images/mobilya.jpeg'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Erkek Giyim",
                        assetImage: AssetImage('images/erkekgiyim.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kişisel\nBakım",
                        assetImage: AssetImage('images/kisiselbakim.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Outdoor",
                        assetImage: AssetImage('images/outdoor2.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kitap",
                        assetImage: AssetImage('images/kitap.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kırtasiye",
                        assetImage: AssetImage('images/kalem.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Pet Shop",
                        assetImage: AssetImage('images/kedigopek.jpeg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
