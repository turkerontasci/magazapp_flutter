import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/products/cart_list.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/settings_screens/payment_screen.dart';

class ShoppingCartScreen extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;
  final String warning = "Sepetiniz boş";
  final double totalPriceClc;

  ShoppingCartScreen(
      {this.id,
      this.title,
      this.image,
      this.price,
      this.qty,
      this.totalPriceClc});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

int itemCount = 1;

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    if (cartList.isEmpty) {
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
      double totalCalculator() {
        double totalPrice = 0.0;
        if (cartList.isEmpty) {
          totalPrice = 0.0;
        } else {
          for (int i = 0; i < cartList.length; i++) {
            totalPrice += cartList[i].price * cartList[i].qty;
          }
        }
        return totalPrice;
      }

      var icon;
      return Scaffold(
        bottomNavigationBar: Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 5.0, bottom: 8.0, top: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Ödenecek Tutar :"),
                    Text(
                      '${totalCalculator().toStringAsFixed(2)} TL',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ReusableCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PaymentScreen(),
                          ),
                        );
                      },
                      color: Colors.pink,
                      cardHeigth: 35.0,
                      cardWidth: 150.0,
                      cardChild: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Alışverişi Tamamla",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                    children: List.generate(
                      cartList.length,
                      (index) => ReusableCard(
                        color: Colors.grey.shade300,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ReusableCard(
                                  cardHeigth: 100.0,
                                  cardWidth: 100.0,
                                  cardChild: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(cartList[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        cartList[index].title,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        "Fiyat : ${cartList[index].price} TL",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        '${(cartList[index].price * cartList[index].qty).toStringAsFixed(2)} TL',
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
                                              setState(() {
                                                if (cartList[index].qty <= 1) {
                                                  cartList.removeAt(index);
                                                } else {
                                                  cartList[index].qty--;
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            '${cartList[index].qty}',
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
                                              setState(() {
                                                cartList[index].qty++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartList.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.solidTrashAlt,
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
              ],
            ),
          ),
        ),
      );
    }
  }
}
