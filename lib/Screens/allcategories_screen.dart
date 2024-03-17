// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/all_categories_cubit/all_categories_cubit.dart';

import '../Widgets/all_categories_view_widget.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});
  static String id = "Categories Screen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    BlocProvider.of<AllCategoriesCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('All categories')),
        body: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
            child: BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
              builder: (context, state) {
                if (state is AllCategoriesSuccess) {
                  List<dynamic> products = state.data;
                  return AllCategoriesBody(products: products);
                } else if (state is AllCategoriesFailure) {
                  return Center(
                    child: Text(state.errMesagge),
                  );
                } else if (state is AllCategoriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}
