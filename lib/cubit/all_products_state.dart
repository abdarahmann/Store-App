part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsSuccess extends AllProductsState {
   final List<ProductModel> productsList;

  AllProductsSuccess({required this.productsList});
}

final class AllProductsLoading extends AllProductsState {}

final class AllProductsFaliure extends AllProductsState {
  final String errMesagge;
  AllProductsFaliure({required this.errMesagge});
}
