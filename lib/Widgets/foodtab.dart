import 'package:emoji_restaurant/Database/database.dart';
import 'package:flutter/material.dart';
import 'listdown_fooditem.dart';

class FoodTab extends StatefulWidget {
  Database database;

  FoodTab(this.database);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (bCtx, i){
        return ListDownFoodItem(
          widget.database.foodTabList[i].imgPath, 
          widget.database.foodTabList[i].foodName,
          widget.database.foodTabList[i].discountFoodPrice, 
          widget.database.foodTabList[i].foodPrice, 
          widget.database.foodTabList[i].starCount,
          i
        );
      }, itemCount: widget.database.foodTabList.length,
    );
  }
}