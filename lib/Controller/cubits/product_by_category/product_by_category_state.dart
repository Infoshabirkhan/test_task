part of 'product_by_category_cubit.dart';

@immutable
sealed class ProductByCategoryState {}

final class ProductByCategoryInitial extends ProductByCategoryState {}
final class ProductByCategoryLoading extends ProductByCategoryState {}
final class ProductByCategoryLoaded extends ProductByCategoryState {
  final ProductModel model;

  ProductByCategoryLoaded({required this.model});
}
final class ProductByCategoryError extends ProductByCategoryState {
  final String error;

  ProductByCategoryError({required this.error});
}
final class ProductByCategoryNoInternet extends ProductByCategoryState {}
