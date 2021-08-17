import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/settings_screens/my_orders.dart';
import 'package:magazapp_flutter/settings_screens/order_track.dart';
import 'package:magazapp_flutter/settings_screens/returns.dart';
import 'package:magazapp_flutter/settings_screens/settings_page.dart';
import 'package:magazapp_flutter/settings_screens/user_profile.dart';
import 'package:magazapp_flutter/settings_screens/wishlist.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                child: Text(
                  "Son Görüntülenen Ürünler:",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(lastList.length, (index) =>
                      ReusableCard(
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductPage(
                                id: lastList[index]["id"],
                                title: lastList[index]["title"],
                                price: lastList[index]["price"],
                                image: lastList[index]["image"],
                              ),
                            ),
                          );
                        },
                        cardHeigth: 150.0,
                        cardWidth: 150.0,
                        cardChild: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(lastList[index]["image"]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfile(),),);
                },
                color: Colors.blueGrey.shade100,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Hesabım",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MyOrders(),),);
                },
                color: Colors.blueGrey.shade100,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Siparişlerim",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => OrderTrack(),),);
                },
                color: Colors.blueGrey.shade100,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Kargolarım",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => WishList(),),);
                },
                color: Colors.blueGrey.shade100,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "İstek Listem",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Returns(),),);
                },
                color: Colors.blueGrey.shade100,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "İadelerim",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage(),),);
                },
                color: Colors.blueGrey.shade100,
                cardHeigth: 50.0,
                cardWidth: 250.0,
                cardChild: Center(
                  child: Text(
                    "Ayarlar",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
