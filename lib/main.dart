import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:magazapp_flutter/screens/category_screen.dart';
import 'package:magazapp_flutter/screens/home_screen.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/screens/shopping_cart_screen.dart';
import 'package:magazapp_flutter/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Magazapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    CategoryScreen(),
    ShoppingCartScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _checkList() {
    if (cartList.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45.0,
        centerTitle: true,
        title: Text(
          "Magazapp",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey.shade400,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Kategoriler',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Badge(
              child: Icon(Icons.shopping_cart),
              position: BadgePosition.topEnd(top: -10, end: -10),
              ignorePointer: false,
              badgeContent: Text(
                (cartList.length).toString(),
                style: TextStyle(color: Colors.white),
              ),
              badgeColor: Colors.pink,
              showBadge: _checkList(),
            ),
            label: 'Sepet',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
              backgroundColor: Colors.white),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}
