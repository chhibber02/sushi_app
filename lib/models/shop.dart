import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    //salmon
    Food(
      imagePath: 'lib/images/salmon_sushi.png',
      name: "Salmon Sushi",
      price: "2.10",
      rating: "4.9",
    ),

    //tuna
    Food(
      imagePath: "lib/images/tuna.png",
      name: "Tuna",
      price: "2.50",
      rating: "4.8",
    ),
  ];

  //customer cart
  List<Food> _cart = [];

  //get methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
