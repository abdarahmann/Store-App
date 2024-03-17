import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/constans.dart';

import '../../helper/api.dart';
import '../../models/product_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  getCategoriesProducts({required String categoryName}) async {
    try {
      emit(CategoryLoading());
      List<dynamic> data = await Api()
          .get(url: "https://fakestoreapi.com/products/category/$categoryName");

      List<ProductModel> productsList = [];
      for (var item in data) {
        productsList.add(ProductModel.fromJson(item));
      }
      emit(CategorySuccess(productsList: productsList));
    } catch (e) {
      emit(CategoryFaliure(errMesagge: kErrorMessage));
    }
  }
}
