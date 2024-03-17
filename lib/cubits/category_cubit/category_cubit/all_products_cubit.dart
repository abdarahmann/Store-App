import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../helper/api.dart';
import '../../models/product_model.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());

  getProducts() async {
    try {
      emit(AllProductsLoading());
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      emit(AllProductsSuccess(productsList: productsList));
    } catch (e) {
      emit(AllProductsFaliure(
          errMesagge: "Oops ' There Was an Error Please Try again Later"));
    }
  }
}
