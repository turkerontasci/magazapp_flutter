import 'package:flutter/material.dart';
import 'package:magazapp_flutter/responsive.dart';
import 'package:magazapp_flutter/responsive_body/desktop_body.dart';
import 'package:magazapp_flutter/responsive_body/mobile_body.dart';
import 'package:magazapp_flutter/responsive_body/tablet_body.dart';

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
      ),
      home: MainPage(
        title: 'Magazapp',
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.title});

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileBody(),
      tablet: TabletBody(),
      desktop: DesktopBody(),
    );
  }
}
