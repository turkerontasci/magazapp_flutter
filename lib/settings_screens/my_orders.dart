import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class MyOrders extends StatefulWidget {

  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  MyOrders({this.id, this.title, this.image, this.price, this.qty});

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Son Siparişleriniz :",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(last_orders.length, (index) => ReusableCard(
                    color: Colors.blueGrey.shade50,
                    cardChild: Row(
                      children: <Widget>[
                        ReusableCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductPage(
                                  id: last_orders[index]["id"],
                                  title: last_orders[index]["title"],
                                  price: last_orders[index]["price"],
                                  image: last_orders[index]["image"],
                                ),
                              ),
                            );
                          },
                          cardHeigth: 100.0,
                          cardWidth: 100.0,
                          cardChild: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: AssetImage(last_orders[index]["image"]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                last_orders[index]["title"],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '${last_orders[index]["price"] * last_orders[index]["qty"]} TL',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Adet :  ${last_orders[index]["qty"]}",
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                  "Sipariş Tarihi : " + last_orders[index]["date"],
                              ),
                            ],
                          ),
                        ),
                      ],
                  ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
