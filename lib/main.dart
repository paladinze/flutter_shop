import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:flutter_shop/providers/orders_provider.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:flutter_shop/screens/auth_screen.dart';
import 'package:flutter_shop/screens/cart_screen.dart';
import 'package:flutter_shop/screens/edit_product_screen.dart';
import 'package:flutter_shop/screens/edit_product_screen.dart';
import 'package:flutter_shop/screens/orders_screen.dart';
import 'package:flutter_shop/screens/product_detail.dart';
import 'package:flutter_shop/screens/products_screen.dart';
import 'package:flutter_shop/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return ProductsProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return OrdersProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.teal,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          ProductsScreen.routeName: (ctx) => ProductsScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
