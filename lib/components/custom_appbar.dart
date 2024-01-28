import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:magazapp_flutter/screens/shopping_cart_screen.dart';
import '../screens/product_page.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

bool _checkList() {
  if (cartList.isEmpty) {
    return false;
  } else {
    return true;
  }
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 70.0,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Magazapp",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                width: 60.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ShoppingCartScreen(),
                          ),
                        );
                      },
                      child: badges.Badge(
                        badgeAnimation: badges.BadgeAnimation.slide(
                          disappearanceFadeAnimationDuration:
                              Duration(milliseconds: 200),
                          curve: Curves.easeInCubic,
                        ),
                        position: badges.BadgePosition.bottomEnd(
                          bottom: 6,
                          end: -6,
                        ),
                        showBadge: _checkList(),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.pink,
                        ),
                        badgeContent: Text(
                          "${(cartList.length).toString()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    badges.Badge(
                      position: badges.BadgePosition.bottomEnd(
                        bottom: 6,
                        end: -6,
                      ),
                      showBadge: true,
                      badgeStyle: badges.BadgeStyle(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        badgeColor: Colors.pink,
                      ),
                      badgeContent: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
