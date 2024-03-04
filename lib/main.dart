// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/Screens/add_product_screen.dart';
import 'package:store/Screens/allcategories_screen.dart';
import 'package:store/Screens/category_screen.dart';
import 'package:store/Screens/settings_screen.dart';
import 'Screens/home_page.dart';
import 'Screens/update_product_screen.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
        AddProductScreen.id:(context) => AddProductScreen(),
        SettingScreen.id:(context) => SettingScreen(),
        CategoriesScreen.id:(context) => CategoriesScreen(),
        CategoryScreen.id:(context) => CategoryScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
