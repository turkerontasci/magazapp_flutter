import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/products/product.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Text(
                  "Son Görüntülenen Ürünler:",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(last_list.length, (index) =>
                      ReusableCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductPage(
                                id: last_list[index]["id"],
                                title: last_list[index]["title"],
                                price: last_list[index]["price"],
                                image: last_list[index]["image"],
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
              ReusableCard(
                color: Colors.blueGrey.shade200,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Siparişlerim",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                color: Colors.blueGrey.shade200,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Kargolarım",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                color: Colors.blueGrey.shade200,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "İstek Listem",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                color: Colors.blueGrey.shade200,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "İadelerim",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                color: Colors.blueGrey.shade200,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Ayarlar",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
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
