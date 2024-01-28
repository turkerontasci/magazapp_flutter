import 'package:flutter/material.dart';
import 'package:magazapp_flutter/products/category_product.dart';
import 'package:magazapp_flutter/products/product.dart';
import '../components/item_card_widget.dart';
import '../components/offers_widget.dart';
import '../components/row_categories_widget.dart';
import '../components/row_offers_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var newList = products + womens_wear_list + mens_wear_list;

    (newList..shuffle()).first;
    (productsRow..shuffle()).first;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OffersWidget(
                height: 275,
                fraction: 0.85,
                id: lastList[0]["id"],
                title: lastList[0]["title"],
                price: lastList[0]["price"],
                imageAsset: lastList[0]["image"],
              ),
              RowCategoriesWidget(
                height: 50,
                width: 100,
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    productsRow.length,
                    (index) => RowOffersWidget(
                      id: productsRow[index]["id"],
                      title: productsRow[index]["title"],
                      price: productsRow[index]["price"],
                      image: productsRow[index]["image"],
                    ),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10.0),
                childAspectRatio: 9.0 / 10.0,
                crossAxisCount: 2,
                children: List.generate(
                  newList.length,
                  (index) => ItemCardWidget(
                    id: newList[index]["id"],
                    title: newList[index]["title"],
                    price: newList[index]["price"],
                    image: newList[index]["image"],
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
