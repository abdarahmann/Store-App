import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';

import 'custom_card.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({
    super.key, required this.products,
  });

 final  List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 100,
        ),
        itemBuilder: (context, index) {
          return CustomCard(product: products[index]);
        });
  }
}
