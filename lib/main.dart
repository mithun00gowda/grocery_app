import 'package:bloc_tutorials/features/cart/ui/cart_screen.dart';
import 'package:bloc_tutorials/features/home/ui/home_screen.dart';
import 'package:bloc_tutorials/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      routes: {
        'cart': (_) => CartScreen(),
        'wishlist': (_) => WishlistScreen(),
      },
      home: HomeScreen(),
    ),
  );
}
