import 'package:flutter/material.dart';

class WishList extends StatefulWidget {

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(10.0),),
            ],
          ),
        ),
      ),
    );
  }
}
