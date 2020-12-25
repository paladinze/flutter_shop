import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...items};
  }

  int get count {
    return _items.length;
  }

  void addItem({String productId, double price, String title}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (oldItem) => CartItem(
          id: oldItem.id,
          price: oldItem.price,
          quantity: oldItem.quantity + 1,
          title: oldItem.title,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () {
          return CartItem(
            id: DateTime.now().toString(),
            price: price,
            quantity: 1,
            title: title,
          );
        },
      );
    }
    notifyListeners();
  }
}