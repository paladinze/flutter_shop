import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final int quantity;
  final String title;
  final double unitPrice;

  const CartItem({
    Key key,
    @required this.quantity,
    @required this.title,
    @required this.unitPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text('\$${unitPrice.toString()}')),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${quantity * unitPrice}'),
          trailing: Text('${quantity} x'),
        ),
      ),
    );
  }
}
