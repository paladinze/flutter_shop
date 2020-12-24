import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/products_grid.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products List'),
        ),
        body: ProductsGrid());
  }
}


