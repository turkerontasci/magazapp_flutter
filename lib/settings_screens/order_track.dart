import 'package:flutter/material.dart';

class OrderTrack extends StatefulWidget {
  @override
  _OrderTrackState createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
