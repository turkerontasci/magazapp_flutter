import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Toplam Tutar : ${totalCalculator().toStringAsFixed(2)} TL",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Ödeme Adımları : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    cartList.length,
                    (index) => ReusableCard(
                      color: Colors.grey.shade300,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ReusableCard(
                                cardHeigth: 75.0,
                                cardWidth: 75.0,
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
                                      "Fiyat : ${cartList[index].price.toStringAsFixed(2)} TL",
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
                                        Text(
                                          'Adet : ${cartList[index].qty}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.grey.shade200,
                                ),
                                height: 150.0,
                                width: 150.0,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5.0,
                                      left: 5.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          "Kayıtlı Adres:",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text("Adres Bilgisi 1..."),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.grey.shade200,
                                ),
                                height: 150.0,
                                width: 150.0,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5.0,
                                      left: 5.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          "Kayıtlı Adres:",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text("Adres Bilgisi 2..."),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.grey.shade200,
                                ),
                                height: 150.0,
                                width: 150.0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Ödeme Bilgileri : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    ReusableCard(
                      color: Colors.grey.shade300,
                      cardHeigth: 250.0,
                      cardWidth: 380.0,
                      cardChild: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              //Kredi Kartı İçin TextField Yazılacak...
                            ],
                          ),
                        ],
                      ),
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
