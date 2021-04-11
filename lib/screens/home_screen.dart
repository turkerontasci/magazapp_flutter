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
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/guitar.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
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
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/nike.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/elbise.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/kulaklık.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 150.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/nikon.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
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
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/canta.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/kalem.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ReusableCard(
                      cardHeigth: 150.0,
                      cardWidth: 360.0,
                      cardChild: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage('images/elbise.jpeg'),
                              fit: BoxFit.cover),
                        ),
                      ),
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
