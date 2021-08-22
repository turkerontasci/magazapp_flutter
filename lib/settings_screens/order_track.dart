import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OrderTrack extends StatefulWidget {
  @override
  _OrderTrackState createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kargolarım",
        ),
        toolbarHeight: 45.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Kargonuz bulunmamaktadır.",
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
