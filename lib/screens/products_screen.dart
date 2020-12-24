import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/products_grid.dart';

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
          )
        ],
      ),
      body: ProductsGrid(filterMode: filterMode),
    );
  }
}
