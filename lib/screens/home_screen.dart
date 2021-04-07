import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ReusableCard(
                      color: Colors.grey,
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 5.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      color: Colors.grey,
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      color: Colors.lightBlue,
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      color: Colors.deepPurple,
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      color: Colors.purpleAccent,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ReusableCard(
                      color: Colors.purple,
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                    ),
                    ReusableCard(
                      color: Colors.blue,
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                    ),
                    ReusableCard(
                      color: Colors.purpleAccent,
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
