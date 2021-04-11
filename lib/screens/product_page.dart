import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReusableCard(
              cardHeigth: 150.0,
              cardWidth: 150.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
