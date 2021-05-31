import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class ShoppingCartScreen extends StatefulWidget {

  final int id;
  final String title;
  final String image;
  final double price;
  final String warning = "Sepetiniz boş";



  ShoppingCartScreen({this.id, this.title, this.image, this.price});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

int itemCount = 1;

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

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

  void deleteItemToList() {
    setState(() {
      cartList.removeLast();
    });
  }

  void totalPriceCalc() {
    double totalPrice;
    for (int i = 1; i <= cartList.length; i++) {
      totalPrice = totalPrice + cartList[i-0].price;
    }
  }

  @override
  Widget build(BuildContext context) {

    if(cartList.isEmpty){
      return Center(
        child: Text(
          "Sepetiniz Boş",
              style: TextStyle(
                fontSize: 18.0,
            fontWeight: FontWeight.bold,
        ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: List.generate(cartList.length, (index) => ReusableCard(
                      color: Colors.grey.shade300,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ReusableCard(
                                cardHeigth: 100.0,
                                cardWidth: 100.0,
                                cardChild: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: AssetImage(cartList[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      cartList[index].title,
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
                                      '${cartList[index].price * itemCount} TL',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 80.0),
                                child: GestureDetector(
                                  onTap: (){
                                    deleteItemToList();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.trash,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Toplam : ${cartList[0].price}  TL',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
}
