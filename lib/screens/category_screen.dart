import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/category_card.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      categoryTitle: "Kadın Giyim",
                      assetImage: AssetImage('images/elbise.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Aksesuar",
                      assetImage: AssetImage('images/canta.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Elektronik",
                      assetImage: AssetImage('images/wdblack.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Müzik",
                      assetImage: AssetImage('images/guitar.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Spor",
                      assetImage: AssetImage('images/nike.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Ev - Yaşam",
                      assetImage: AssetImage('images/mobilya.jpeg'),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    CategoryCard(
                      categoryTitle: "Erkek Giyim",
                      assetImage: AssetImage('images/erkekgiyim.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Kişisel\nBakım",
                      assetImage: AssetImage('images/kisiselbakim.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Outdoor",
                      assetImage: AssetImage('images/outdoor2.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Kitap",
                      assetImage: AssetImage('images/kitap.jpeg'),
                    ),
                    CategoryCard(
                      categoryTitle: "Kırtasiye",
                      assetImage: AssetImage('images/kalem.jpeg'),
                    ),
                    CategoryCard(
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
    );
  }
}
