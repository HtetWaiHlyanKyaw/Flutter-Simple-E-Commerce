import 'package:e_commerce_ui/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "Samsung Galaxy Z Fold 6",
        price: 2999,
        imagePath: 'flutter-e-commerce/samsung galaxy z fold 6.jpg',
        description: "Excellent product with high functionalities"),
    Product(
        name: "Nike Air Force 1",
        price: 149,
        imagePath: 'flutter-e-commerce/nike air force 1.webp',
        description: "All time classy timeless icon"),
    Product(
        name: "Beats Solo 3",
        price: 249,
        imagePath: 'flutter-e-commerce/beats solo 3.jpg',
        description: "Best wireless headphones"),
  ];

  List<Product> _cart = [];

  List<Product> get cart => _cart;
  List<Product> get shop => _shop;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
