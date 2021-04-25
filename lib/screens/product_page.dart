import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:magazapp_flutter/products/product.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

double price = 40.0;
int itemCount = 1;

class _ProductPageState extends State<ProductPage> {

  void _incrementCounter() {
    setState(() {
      itemCount++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (itemCount <= 1) {
        itemCount = 1;
      } else {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReusableCard(
                  color: Colors.grey.shade300,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ReusableCard(
                              cardHeigth: 300.0,
                              cardWidth: 300.0,
                              cardChild: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: AssetImage('images/nike.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Ayakkabı',
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
                                '$price TL',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    fillColor: Colors.grey.shade50,
                                    icon: Icons.remove,
                                    onPressed: () {
                                      _decrementCounter();
                                    },
                                  ),
                                  Text(
                                    '$itemCount',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  RoundIconButton(
                                    fillColor: Colors.grey.shade50,
                                    icon: Icons.add,
                                    onPressed: () {
                                      _incrementCounter();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Toplam : ${price * itemCount} TL',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        ReusableCard(
                            cardHeigth: 50.0,
                            cardWidth: 150.0,
                            color: Colors.pink,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sepete Ekle",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
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
