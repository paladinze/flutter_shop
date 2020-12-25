import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:flutter_shop/providers/product_provider.dart';
import 'package:flutter_shop/screens/product_detail.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theProduct = Provider.of<ProductItemProvider>(context);
    final theCart = Provider.of<CartProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: theProduct.id);
          },
          child: Image.network(
            theProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              theProduct.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              theProduct.toggleLikeStatus();
            },
          ),
          title: Text(theProduct.title, textAlign: TextAlign.center),
          trailing: IconButton(
            icon: Icon(Icons.card_giftcard),
            onPressed: () {
              theCart.addItem(
                productId: theProduct.id,
                price: theProduct.price,
                title: theProduct.title,
              );
            },
          ),
          backgroundColor: Colors.black45,
        ),
      ),
    );
  }
}
