part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
    final List<ProductModel> productsList;

  CategorySuccess({required this.productsList});
}
final class CategoryFaliure extends CategoryState {
    final String errMesagge;
  CategoryFaliure({required this.errMesagge});
}