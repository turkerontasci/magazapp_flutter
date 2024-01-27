import 'package:flutter/material.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/settings_screens/order_track.dart';
import 'package:magazapp_flutter/settings_screens/returns.dart';
import 'package:magazapp_flutter/settings_screens/settings_page.dart';
import 'package:magazapp_flutter/settings_screens/user_profile.dart';

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
                padding:
                    const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
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
                  children: List.generate(
                    lastOrders.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductPage(
                              id: lastOrders[index]["id"],
                              title: lastOrders[index]["title"],
                              price: lastOrders[index]["price"],
                              image: lastOrders[index]["image"],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(lastOrders[index]["image"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserProfile(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blueGrey.shade100,
                  height: 50.0,
                  width: 250.0,
                  child: Center(
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
              ),
              Container(
                color: Colors.blueGrey.shade100,
                height: 50.0,
                width: 250.0,
                child: Center(
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderTrack(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blueGrey.shade100,
                  height: 50.0,
                  width: 250.0,
                  child: Center(
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
              ),
              Container(
                color: Colors.blueGrey.shade100,
                height: 50.0,
                width: 250.0,
                child: Center(
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Returns(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blueGrey.shade100,
                  height: 50.0,
                  width: 250.0,
                  child: Center(
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SettingsPage(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blueGrey.shade100,
                  height: 50.0,
                  width: 250.0,
                  child: Center(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
