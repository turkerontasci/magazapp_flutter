import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/products/cart_list.dart';
import 'package:toast/toast.dart';

class ProductPage extends StatefulWidget {


  final int id;
  final String title;
  final String image;
  final double price;



  ProductPage({this.id, this.title, this.image, this.price});

  @override
  _ProductPageState createState() => _ProductPageState();
}

int itemCount = 1;

List<CartList> cartList = [];

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



  void addItemToList() {
    setState(() {
      cartList.add(
        CartList(
          id: widget.id,
          title: widget.title,
          price: widget.price,
          image: widget.image,
        ),
      );
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
                                    image: AssetImage(widget.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                widget.title,
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
                                '${widget.price} TL',
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
                          'Toplam : ${widget.price * itemCount} TL',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        ReusableCard(
                          onPress: (){
                            addItemToList();
                            Toast.show(
                                "Ürün sepete eklendi",
                                context,
                                duration: Toast.LENGTH_SHORT,
                                gravity:  Toast.BOTTOM,
                              backgroundColor: Colors.grey.shade300,
                              textColor: Colors.black,
                            );
                          },
                            cardHeigth: 50.0,
                            cardWidth: 150.0,
                            color: Colors.pink,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
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
