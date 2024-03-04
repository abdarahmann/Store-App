// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store/Screens/category_screen.dart';
import 'package:store/Widgets/custom_button.dart';

import '../service/all_categories_service.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  static String id = "Categories Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('All categories')),
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
          child: FutureBuilder<List<dynamic>>(
            future: AllCategoriesService().getCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> products = snapshot.data!;
                print(products);
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              ontab: () {
                                Navigator.pushNamed(context, CategoryScreen.id ,arguments: products[index]);
                              },
                              text: products[index],
                              color: Color.fromARGB(255, 210, 203, 203)),
                        ],
                      );
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
