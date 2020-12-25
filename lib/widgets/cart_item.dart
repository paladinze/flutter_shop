import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int quantity;
  final String title;
  final double unitPrice;

  const CartItem({
    Key key,
    @required this.id,
    @required this.productId,
    @required this.quantity,
    @required this.title,
    @required this.unitPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final theCart = Provider.of<CartProvider>(context, listen: false);
        theCart.removeItem(productId);
      },
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you mad?'),
            content: Text('Will remove the item from Cart!'),
            actions: [
              FlatButton(onPressed: () { Navigator.of(ctx).pop(false); }, child: Text('No')),
              FlatButton(onPressed: () { Navigator.of(ctx).pop(true); }, child: Text('Yes')),
            ],
          ),
        );
      },
      child: Card(
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
      ),
    );
  }
}
