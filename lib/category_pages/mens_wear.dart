import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/products/category_product.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
class MensWear extends StatefulWidget {

  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  MensWear({this.id, this.title, this.image, this.price, this.qty});

  @override
  _MensWearState createState() => _MensWearState();
}

class _MensWearState extends State<MensWear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 60.0,
              child: Column(
                children: List.generate(products.length, (index) => ReusableCard(
                  color: Colors.grey.shade200,
                  cardHeigth: 50.0,
                  cardWidth: 50.0,
                  cardChild: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(products[index]["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(mens_wear_list.length, (index) => Container(
                  child: Column(
                    children: <Widget>[
                      ReusableCard(
                        color: Colors.blueGrey.shade200,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductPage(
                                id: mens_wear_list[index]["id"],
                                title: mens_wear_list[index]["title"],
                                price: mens_wear_list[index]["price"],
                                image: mens_wear_list[index]["image"],
                              ),
                            ),
                          );
                        },
                        cardHeigth: 130.0,
                        cardWidth: 130.0,
                        cardChild: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(mens_wear_list[index]["image"]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Text(
                        "${mens_wear_list[index]["price"]} TL",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        mens_wear_list[index]["title"],
                      ),
                    ],
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
