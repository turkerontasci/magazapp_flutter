import 'package:flutter/material.dart';

class Returns extends StatefulWidget {

  @override
  _ReturnsState createState() => _ReturnsState();
}

class _ReturnsState extends State<Returns> {
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
