
import 'package:flutter/material.dart';

import '../Screens/category_screen.dart';
import 'custom_button.dart';

class AllCategoriesBody extends StatelessWidget {
  const AllCategoriesBody({
    super.key,
    required this.products,
  });

  final List products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  ontab: () {
                    Navigator.pushNamed(
                        context, CategoryScreen.id,
                        arguments: products[index]);
                  },
                  text: products[index],
                  color: const Color.fromARGB(255, 210, 203, 203)),
            ],
          );
        });
  }
}
