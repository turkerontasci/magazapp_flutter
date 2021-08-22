import 'package:flutter/material.dart';

class Returns extends StatefulWidget {
  @override
  _ReturnsState createState() => _ReturnsState();
}

class _ReturnsState extends State<Returns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İadelerim",
        ),
        centerTitle: true,
        toolbarHeight: 45.0,
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "İade işleminiz bulunmamaktadır.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
