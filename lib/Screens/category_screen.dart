// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Widgets/all_products_view_widget.dart';
import 'package:store/cubits/category_cubit/category_cubit.dart';
class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  static String id = "CategoryScreen";

  @override
  Widget build(BuildContext context) {
    
    dynamic product = ModalRoute.of(context)!.settings.arguments as dynamic;
      BlocProvider.of<CategoryCubit>(context).getCategoriesProducts(categoryName:product );
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(product),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
          child: BlocBuilder<CategoryCubit,CategoryState>(
            
            builder: (context,state){
            
               if (state is CategorySuccess) {
              return AllProductsView(products: state.productsList);
            } else if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryFaliure) {
              return Center(
                child: Text(state.errMesagge),
              );
            }else{
              return const Center(
                child:  Text("Oops ' There Was an Error Please Try again Later"),
              );
            }
          
          })
            
          )
        );
  }
}
