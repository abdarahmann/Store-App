
import 'package:store/helper/api.dart';
import '../models/product_model.dart';

class Getcategory {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    // ignore: missing_required_param
    List<dynamic>data =await Api().get(url: "https://fakestoreapi.com/products/category/$categoryName");

   
      List<ProductModel> productsList = [];
      for (var item in data) {
        productsList.add(ProductModel.fromJson(item));
      }
      return productsList;
    
  }
}
