import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/orders_provider.dart';
import 'package:flutter_shop/widgets/OrderItem.dart' as OrderView;
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final theOrders = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('The Orders'),
      ),
      body: ListView.builder(
        itemCount: theOrders.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderView.OrderItem(order: theOrders.orders[index]);
        },
      ),
    );
  }
}
