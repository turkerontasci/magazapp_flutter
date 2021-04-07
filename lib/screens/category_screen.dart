import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ReusableCard(
                color: Colors.grey,
                cardHeigth: 150.0,
                cardWidth: 360.0,
              ),
              ReusableCard(
                color: Colors.grey,
                cardHeigth: 150.0,
                cardWidth: 360.0,
              ),
              ReusableCard(
                color: Colors.grey,
                cardHeigth: 150.0,
                cardWidth: 360.0,
              ),
              ReusableCard(
                color: Colors.grey,
                cardHeigth: 150.0,
                cardWidth: 360.0,
              ),
              ReusableCard(
                color: Colors.grey,
                cardHeigth: 150.0,
                cardWidth: 360.0,
              ),
              ReusableCard(
                color: Colors.grey,
                cardHeigth: 150.0,
                cardWidth: 360.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
