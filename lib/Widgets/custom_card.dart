// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';

import '../Screens/update_product_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            width: 190,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  offset: Offset(10, 10))
            ]),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 6),
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price}',
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -32.5,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
