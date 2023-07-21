import 'package:emoji_restaurant/Model/foodtablist.dart';
import 'package:emoji_restaurant/Model/recomfoodlist_model.dart';
import 'package:flutter/material.dart';

class Database{
  var recomFoodList = <RecomFoodListModel> [
    RecomFoodListModel(Colors.amber[100], Colors.amber[800],'assets/burger.png', 'Hamburg', 21),
    RecomFoodListModel(Colors.blue[100], Colors.blue[800],'assets/fries.png', 'Chips', 15),
    RecomFoodListModel(Colors.green[100], Colors.green[800] ,'assets/doughnut.png', 'Doughnut', 10),
    RecomFoodListModel(Colors.amber[100], Colors.amber[800],'assets/burger.png', 'Hamburg', 21),
    RecomFoodListModel(Colors.blue[100], Colors.blue[800],'assets/fries.png', 'Chips', 15),
    RecomFoodListModel(Colors.green[100], Colors.green[800] ,'assets/doughnut.png', 'Doughnut', 10),
  ];

  var foodTabList = <FoodTabListModel>[
    FoodTabListModel('assets/pizza.png', 'Delicious pizza', 12, 16, 5),
    FoodTabListModel('assets/popcorn.png', 'Delicious popcorn', 12, 16, 5),
    FoodTabListModel('assets/sandwich.png', 'Delicious sandwich', 12, 16, 5),
    FoodTabListModel('assets/taco.png', 'Delicious taco', 12, 16, 5),
    FoodTabListModel('assets/pizza.png', 'Delicious pizza', 12, 16, 5),
    FoodTabListModel('assets/sandwich.png', 'Delicious sandwich', 12, 16, 5),
    FoodTabListModel('assets/taco.png', 'Delicious taco', 12, 16, 5),
    FoodTabListModel('assets/pizza.png', 'Delicious pizza', 12, 16, 5),
  ];
}