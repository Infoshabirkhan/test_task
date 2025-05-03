part of 'product_detail_cubit.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}
final class ProductDetailLoading extends ProductDetailState {}
final class ProductDetailLoaded extends ProductDetailState {
  final Product model;

  ProductDetailLoaded({required this.model});
}
final class ProductDetailError extends ProductDetailState {
  final String error;

  ProductDetailError({required this.error});
}
