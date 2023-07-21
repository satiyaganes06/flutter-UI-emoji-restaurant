import 'package:emoji_restaurant/Pages/dashboard.dart';
import 'package:emoji_restaurant/Pages/product_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
