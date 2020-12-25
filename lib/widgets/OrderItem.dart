import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/orders_provider.dart' as Ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final Ord.OrderItem order;

  const OrderItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle:
                Text('${DateFormat('dd MM yyyy').format(order.dateTime)}'),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
