

import 'package:flutter/material.dart';

class ProductItemProvider with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  ProductItemProvider({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleLikeStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
