import 'package:flutter/material.dart';

class Electronics extends StatefulWidget {

  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  Electronics({this.id, this.title, this.image, this.price, this.qty});

  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
