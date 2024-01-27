import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  MyOrders(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.qty});

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Siparişlerim",
        ),
        backgroundColor: Colors.pink,
        toolbarHeight: 45.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Siparişiniz Yok",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
