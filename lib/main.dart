

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Screens/add_product_screen.dart';
import 'package:store/Screens/allcategories_screen.dart';
import 'package:store/Screens/category_screen.dart';
import 'package:store/Screens/settings_screen.dart';
import 'package:store/cubits/all_categories_cubit/all_categories_cubit.dart';
import 'package:store/cubits/category_cubit/category_cubit.dart';
import 'Screens/home_page.dart';
import 'Screens/update_product_screen.dart';
import 'cubits/all_products_cubit/all_products_cubit.dart';
import 'simple_bloc_observer.dart';

void main() {
   Bloc.observer = SimpleBlocObserver();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductsCubit(),
        ),
         BlocProvider(
          create: (context) => AllCategoriesCubit(),
        ),
       BlocProvider(
          create: (context) => CategoryCubit(),
        ),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          UpdateProductScreen.id: (context) => UpdateProductScreen(),
          AddProductScreen.id: (context) => AddProductScreen(),
          SettingScreen.id: (context) => SettingScreen(),
          CategoriesScreen.id: (context) => CategoriesScreen(),
          CategoryScreen.id: (context) => CategoryScreen(),
        },
        initialRoute: HomeScreen.id,
      ),
    );
  }
}
