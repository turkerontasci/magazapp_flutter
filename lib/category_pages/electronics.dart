import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/products/category_product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class Electronics extends StatefulWidget {

  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  Electronics({this.id, this.title, this.image, this.price, this.qty});

  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(womens_wear_list.length, (index) => Container(
            child: Column(
              children: <Widget>[
                ReusableCard(
                  color: Colors.blueGrey.shade200,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductPage(
                          id: womens_wear_list[index]["id"],
                          title: womens_wear_list[index]["title"],
                          price: womens_wear_list[index]["price"],
                          image: womens_wear_list[index]["image"],
                        ),
                      ),
                    );
                  },
                  cardHeigth: 160.0,
                  cardWidth: 160.0,
                  cardChild: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage(womens_wear_list[index]["image"]),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Text(
                  "${womens_wear_list[index]["price"]} TL",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  womens_wear_list[index]["title"],
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
