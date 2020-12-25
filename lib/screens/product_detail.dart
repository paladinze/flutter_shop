import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final theProduct = productsData.findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(theProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                theProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('\$${theProduct.price}'),
            SizedBox(
              height: 10,
            ),
            Text('${theProduct.description}'),
          ],
        ),
      ),
    );
  }
}
