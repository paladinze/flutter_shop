import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:flutter_shop/widgets/badge.dart';
import 'package:flutter_shop/widgets/drawer.dart';
import 'package:flutter_shop/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum FILTER_MODE {
  ALL,
  LIKED,
}

class ProductsScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var filterMode = FILTER_MODE.ALL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Products List'),
        actions: [
          PopupMenuButton(
            onSelected: (val) {
              setState(() {
                filterMode = val;
              });
            },
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FILTER_MODE.ALL,
                ),
                PopupMenuItem(
                  child: Text('Show Liked Only'),
                  value: FILTER_MODE.LIKED,
                ),
              ];
            },
          ),
          Consumer<CartProvider>(
            builder: (ctx, theCart, ch) => Badge(
              value: theCart.count.toString(),
              child: ch,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(filterMode: filterMode),
    );
  }
}
