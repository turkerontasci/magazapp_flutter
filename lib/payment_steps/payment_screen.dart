import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/user_info.dart';
import 'package:magazapp_flutter/payment_steps/summary_page.dart';
import 'package:magazapp_flutter/products/order_list.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget {

  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  PaymentScreen({
    this.id, this.title, this.image, this.price, this.qty
});

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
  String _chosenValue;

  void addItemToList() {
    setState(() {
      orderList.add(
        OrderList(
          id: widget.id,
          title: widget.title,
          price: widget.price,
          image: widget.image,
        ),
      );
    });
  }

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
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
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
                  color: Colors.green,
                  onPressed: () {
                    addItemToList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SummaryPage(),
                      ),
                    );
                  },
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
                      CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        showBackView: isCvvFocused,
                        cardBgColor: Colors.grey.shade200,
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        height: 175,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        width: MediaQuery.of(context).size.width,
                        animationDuration: Duration(milliseconds: 1000),
                      ),
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
                                themeColor: Colors.red,
                                obscureCvv: true,
                                obscureNumber: true,
                                cardNumberDecoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Kart Numarası',
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                ),
                                expiryDateDecoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Son Kullanım',
                                  hintText: 'XX/XX',
                                ),
                                cvvCodeDecoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CVV',
                                  hintText: 'XXX',
                                ),
                                cardHolderDecoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Ad Soyad',
                                ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      'Tek Çekim, ${totalCalculator().toStringAsFixed(2)} TL',
                      '2 Taksit, 2x ${(totalCalculator()/2).toStringAsFixed(2)} TL',
                      '3 Taksit, 3x ${(totalCalculator()/3).toStringAsFixed(2)} TL',
                      '4 Taksit, 4x ${(totalCalculator()/4).toStringAsFixed(2)} TL',
                      '5 Taksit, 5x ${(totalCalculator()/5).toStringAsFixed(2)} TL',
                      '6 Taksit, 6x ${(totalCalculator()/6).toStringAsFixed(2)} TL',
                      '9 Taksit, 9x ${(totalCalculator()/9).toStringAsFixed(2)} TL',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Taksit Seçiniz",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
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
