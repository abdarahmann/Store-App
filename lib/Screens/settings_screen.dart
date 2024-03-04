import 'package:flutter/material.dart';
import 'package:store/Screens/add_product_screen.dart';
import 'package:store/Screens/allcategories_screen.dart';
import 'package:store/Widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  static String id = 'Setting Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomButton(
              ontab: () {
                Navigator.pushNamed(context, AddProductScreen.id);
              },
              text: 'Add Product',
              color: const Color.fromRGBO(76, 175, 80, 1),
              textColor: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              ontab: () {
                Navigator.pushNamed(context, CategoriesScreen.id);
              },
              text: 'All Categories',
              color: const Color.fromRGBO(76, 175, 80, 1),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
