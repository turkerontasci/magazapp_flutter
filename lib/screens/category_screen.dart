import 'package:flutter/material.dart';
import 'package:magazapp_flutter/category_pages/accessories.dart';
import 'package:magazapp_flutter/category_pages/electronics.dart';
import 'package:magazapp_flutter/category_pages/home_design.dart';
import 'package:magazapp_flutter/category_pages/mens_wear.dart';
import 'package:magazapp_flutter/category_pages/personal_care.dart';
import 'package:magazapp_flutter/components/category_card.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CategoryCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WomensWear(),
                            ),
                          );
                        },
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kadın Giyim",
                        assetImage: AssetImage('images/category_images/elbise.jpeg'),
                      ),
                      CategoryCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MensWear(),
                            ),
                          );
                        },
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Erkek Giyim",
                        assetImage: AssetImage('images/category_images/erkekgiyim.jpeg'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CategoryCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Accessories(),
                            ),
                          );
                        },
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Aksesuar",
                        assetImage: AssetImage('images/category_images/canta.jpeg'),
                      ),
                      CategoryCard(
                        onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Electronics(),
                          ),
                        );
                      },
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Elektronik",
                        assetImage: AssetImage('images/category_images/wdblack.jpeg'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CategoryCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeDesign(),
                            ),
                          );
                        },
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Ev - Yaşam",
                        assetImage: AssetImage('images/category_images/mobilya.jpeg'),
                      ),
                      CategoryCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PersonalCare(),
                            ),
                          );
                        },
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kişisel\nBakım",
                        assetImage: AssetImage('images/category_images/kisiselbakim.jpeg'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Müzik",
                        assetImage: AssetImage('images/category_images/guitar.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Spor",
                        assetImage: AssetImage('images/category_images/nike.jpeg'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Outdoor",
                        assetImage: AssetImage('images/category_images/outdoor2.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kitap",
                        assetImage: AssetImage('images/category_images/kitap.jpeg'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Kırtasiye",
                        assetImage: AssetImage('images/category_images/kalem.jpeg'),
                      ),
                      CategoryCard(
                        fontSize: fontSize,
                        cardWidth: cardWidth,
                        cardHeigth: cardHeigth,
                        categoryTitle: "Pet Shop",
                        assetImage: AssetImage('images/category_images/kedigopek.jpeg'),
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
