// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/service/category_service.dart';

import '../../Widgets/custom_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  static String id = "CategoryScreen";
  @override
  Widget build(BuildContext context) {
  dynamic  product =
        ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(product),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
          child: FutureBuilder<List<ProductModel>>(
            future: Getcategory().getCategoriesProducts(categoryName: product),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(product: products[index]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
