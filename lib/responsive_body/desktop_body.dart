import 'package:flutter/material.dart';
import 'package:magazapp_flutter/products/categories.dart';
import '../category_pages/mens_wear.dart';
import '../components/custom_appbar.dart';
import '../components/header_widget.dart';
import '../components/item_card_widget.dart';
import '../components/offers_widget.dart';
import '../components/row_offers_widget.dart';
import '../products/category_product.dart';
import '../products/product.dart';
import '../screens/category_screen.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  @override
  Widget build(BuildContext context) {
    var newList = products + womens_wear_list + mens_wear_list;

    (newList..shuffle()).first;
    (productsRow..shuffle()).first;

    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 120.0,
          right: 120.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OffersWidget(
                height: 350,
                fraction: 0.6,
                id: lastList[0]["id"],
                title: lastList[0]["title"],
                price: lastList[0]["price"],
                imageAsset: lastList[0]["image"],
              ),
              HeaderWidget(
                title: "Kategoriler",
                route: CategoryScreen(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink,
                        ),
                        width: MediaQuery.sizeOf(context).width / 11,
                        height: 60.0,
                        child: Center(
                          child: Text(
                            "${categories[index]["title"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              HeaderWidget(
                title: "Fırsatlar",
                route: MensWear(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    products.length,
                    (index) => RowOffersWidget(
                      id: products[index]["id"],
                      title: products[index]["title"],
                      price: products[index]["price"],
                      image: products[index]["image"],
                    ),
                  ),
                ),
              ),
              HeaderWidget(
                title: "Bugüne Özel",
                route: CategoryScreen(),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10.0),
                childAspectRatio: 8.0 / 10.0,
                crossAxisCount: 5,
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
