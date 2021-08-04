import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Marka",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.pink,
                              ),
                            ),
                            Text(
                              "${widget.title}",
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '${(widget.price).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  " TL",
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 90.0,
                          width: 130.0,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        _decrementCounter();
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            color: Colors.pink.shade400,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.pink.shade400,
                                        ),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '$itemCount',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    GestureDetector(
                                      onTap: () {
                                        _incrementCounter();
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            color: Colors.pink.shade400,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                GestureDetector(
                                  onTap: () {
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
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    width: 130.0,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      "Sepete Ekle",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
              SizedBox(height: 5.0),
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
