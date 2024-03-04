// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Widgets/custom_button.dart';
import 'package:store/Widgets/custom_textfield.dart';
import 'package:store/helper/Custom_Snack_Bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/service/update_product.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({
    super.key,
  });
  static String id = 'Update Page';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, price, desc, image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
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
                      await updateproduct(product);
                      print(product);
                    } catch (e) {
                      snackbar(context, e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  text: 'Update',
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

  Future<ProductModel> updateproduct(ProductModel product) {
    return UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.title : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
