import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../helper/api.dart';

part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit() : super(AllCategoriesInitial());
  getCategories() async {
    try {
      emit(AllCategoriesLoading());
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products/categories');
      emit(AllCategoriesSuccess(data: data));
    } catch (e) {
      emit(AllCategoriesFailure(
          errMesagge: "Oops ' There Was an Error Please Try again Later"));
    }
  }
}
