import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/components/category_card.dart';
import 'package:magazapp_flutter/products/cart_list.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:toast/toast.dart';

class ProductPage extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;
  final String specs;

  ProductPage(
      {this.id, this.title, this.image, this.price, this.qty, this.specs});

  @override
  _ProductPageState createState() => _ProductPageState();
}

List<CartList> cartList = [];

class _ProductPageState extends State<ProductPage> {
  int itemCount = 1;

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
          qty: itemCount,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Fiyat: ",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${(widget.price * itemCount).toStringAsFixed(2)} ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "TL",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  addItemToList();
                  Toast.show(
                    "Ürün sepete eklendi",
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.BOTTOM,
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black,
                  );
                },
                child: Text(
                  "Sepete Ekle",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 5.0),
                          child: Container(
                            height: 300.0,
                            width: 300.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ), //Image
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ), //Title
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Row(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  _tabSection(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Colors.grey.shade300,
          child: TabBar(
            tabs: [
              Tab(text: "Özellikler"),
              Tab(text: "Açıklama"),
              Tab(text: "Yorumlar"),
              Tab(text: "Taksit"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black26,
            labelStyle: TextStyle(
              fontSize: 13.0,
            ),
          ),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Ürün Özellikleri :"),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ReusableCard(
                            color: Colors.grey.shade200,
                            cardHeigth: 30.0,
                            cardChild: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                products_specs[0]["spec"],
                              ),
                            ),
                          ),
                          ReusableCard(
                            color: Colors.grey.shade200,
                            cardHeigth: 30.0,
                            cardChild: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                products_specs[1]["spec"],
                              ),
                            ),
                          ),
                          ReusableCard(
                            color: Colors.grey.shade200,
                            cardHeigth: 30.0,
                            cardChild: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                products_specs[2]["spec"],
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
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  "Ürün Açıklaması :",
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text("Kullanıcı Yorumları :"),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text("Taksit Seçenekleri :"),
              ),
            )
          ]),
        ),
      ],
    ),
  );
}
