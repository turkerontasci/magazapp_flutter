import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/user_info.dart';
import 'package:magazapp_flutter/products/order_list.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  PaymentScreen(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.qty});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

List<OrderList> orderList = [];

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

    Color _selectedColor = Colors.grey.shade200;
    Color _selectedText = Colors.black;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
          child: Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Toplam Tutar :",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      "${totalCalculator().toStringAsFixed(2)} TL",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'Onayla',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: _selectedColor,
                                  ),
                                  height: 150.0,
                                  width: 150.0,
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
                                            color: _selectedText,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Text(
                                          "${userInfo[0]["address"][0]}",
                                          style: TextStyle(
                                            color: _selectedText,
                                            letterSpacing: 0.9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
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
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Text(
                                          "${userInfo[0]["address"][1]}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 0.9,
                                          ),
                                        ),
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
                                  onPressed: () {
                                    //TODO onPressed eklenecek
                                  },
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              CreditCardForm(
                                cardNumber: cardNumber,
                                cvvCode: cvvCode,
                                cardHolderName: cardHolderName,
                                expiryDate: expiryDate,
                                formKey: formKey,
                                obscureCvv: true,
                                obscureNumber: true,
                                onCreditCardModelChange:
                                    onCreditCardModelChange,
                              ),
                            ],
                          ),
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
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
