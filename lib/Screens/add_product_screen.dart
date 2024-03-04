// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Widgets/custom_button.dart';
import 'package:store/Widgets/custom_textfield.dart';
import 'package:store/helper/Custom_Snack_Bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/service/add_product.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({
    super.key,
  });
  static String id = 'Add Product Page';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? productName, price, desc, image, categ;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Product',
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onchange: (data) {
                    productName = data;
                  },
                  hintText: 'product name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onchange: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  input: TextInputType.number,
                  onchange: (data) {
                    price = data;
                  },
                  hintText: 'price',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onchange: (data) {
                    categ = data;
                  },
                  hintText: 'Category',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onchange: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  ontab: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await addproduct();
                      print('succes');
                    } catch (e) {
                      snackbar(context, e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  text: 'Add Product',
                  color: Colors.blue,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ProductModel> addproduct() {
    return AddProduct().addProduct(
      title: productName!,
      price: price!,
      desc: desc!,
      image: image!,
      category: categ!,
    );
  }
}
