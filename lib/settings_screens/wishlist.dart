import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class WishList extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;

  WishList({this.id, this.title, this.image, this.price});

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İstek Listem",
        ),
        centerTitle: true,
        toolbarHeight: 45.0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  wishList.length,
                  (index) => ReusableCard(
                    color: Colors.blueGrey.shade50,
                    cardChild: Row(
                      children: <Widget>[
                        ReusableCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductPage(
                                  id: wishList[index]["id"],
                                  title: wishList[index]["title"],
                                  price: wishList[index]["price"],
                                  image: wishList[index]["image"],
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
                                  image: AssetImage(wishList[index]["image"]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                wishList[index]["title"],
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
                                '${wishList[index]["price"].toStringAsFixed(2)} TL',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
    );
  }
}
