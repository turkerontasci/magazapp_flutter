import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ReusableCard(
                    color: Colors.grey,
                    cardWidth: 350.0,
                    cardHeigth: 250.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
