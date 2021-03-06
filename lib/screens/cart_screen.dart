import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:flutter_shop/providers/orders_provider.dart';
import 'package:flutter_shop/widgets/cart_item.dart' as ci;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/the-cart';

  @override
  Widget build(BuildContext context) {
    final theCart = Provider.of<CartProvider>(context);
    final items = theCart.itemsList;
    final keys = theCart.itemKeyList;

    return Scaffold(
      appBar: AppBar(
        title: Text('The Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text(
                      '\$${theCart.total}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: theCart.count,
              itemBuilder: (ctx, idx) {
                final item = items[idx];
                return ci.CartItem(
                  id: item.id,
                  productId: keys[idx],
                  title: item.title,
                  unitPrice: item.price,
                  quantity: item.quantity,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final ordersData = Provider.of<OrdersProvider>(context, listen: false);
          ordersData.addOrder(items, theCart.total);
          theCart.clear();
        },
        child: Icon(Icons.money),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
