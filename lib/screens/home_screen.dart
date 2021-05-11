import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/products/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductPage(
                              id: products[3]["id"],
                              title: products[3]["title"],
                              price: products[3]["price"],
                              image: products[3]["image"],
                            ),
                          ),
                        );
                      },
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(products[3]["image"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 5.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(products_row.length, (index) =>
                      ReusableCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductPage(
                                id: products_row[index]["id"],
                                title: products_row[index]["title"],
                                price: products_row[index]["price"],
                                image: products_row[index]["image"],
                              ),
                            ),
                          );
                        },
                        cardHeigth: 150.0,
                        cardWidth: 150.0,
                        cardChild: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(products_row[index]["image"]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(products.length, (index) =>
                      ReusableCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductPage(
                                id: products[index]["id"],
                                title: products[index]["title"],
                                price: products[index]["price"],
                                image: products[index]["image"],
                              ),
                            ),
                          );
                        },
                        cardHeigth: 150.0,
                        cardWidth: 360.0,
                        cardChild: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(products[index]["image"]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

