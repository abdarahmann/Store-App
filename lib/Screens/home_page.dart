import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Screens/settings_screen.dart';
import '../Widgets/all_products_view_widget.dart';
import '../cubit/all_products_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Call getProducts() when the widget is initialized
    BlocProvider.of<AllProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingScreen.id);
              },
              icon: const Icon(Icons.settings),
            ),
            const Text("Magic Store"),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartShopping),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
        child: BlocBuilder<AllProductsCubit, AllProductsState>(
          builder: (context, state) {
            if (state is AllProductsSuccess) {
              return AllProductsView(products: state.productsList);
            } else if (state is AllProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AllProductsFaliure) {
              return Center(
                child: Text(state.errMesagge),
              );
            }else{
              return const Center(
                child:  Text("Oops ' There Was an Error Please Try again Later"),
              );
            }
          },
        ),
      ),
    );
  }
}
