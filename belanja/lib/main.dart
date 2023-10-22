import 'package:flutter/material.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';

void main() {
  runApp(MyApp());
}

const String homeRoute = '/';
const String itemRoute = '/item';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => HomePage(),
        itemRoute: (context) => ItemPage(),
      },
    );
  }
}
