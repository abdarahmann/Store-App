part of 'all_categories_cubit.dart';

@immutable
sealed class AllCategoriesState {}

final class AllCategoriesInitial extends AllCategoriesState {}

final class AllCategoriesLoading extends AllCategoriesState {}

final class AllCategoriesSuccess extends AllCategoriesState {
  final List<dynamic> data;

  AllCategoriesSuccess({required this.data});

}

final class AllCategoriesFailure extends AllCategoriesState {
  final String errMesagge;
  AllCategoriesFailure({required this.errMesagge});
}
