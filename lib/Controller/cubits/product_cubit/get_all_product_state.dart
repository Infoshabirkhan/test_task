part of 'get_all_product_cubit.dart';

@immutable
sealed class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}
final class GetAllProductLoading extends GetAllProductState {}
final class GetAllProductNoInternet extends GetAllProductState {}
final class GetAllProductLoaded extends GetAllProductState {
  final ProductModel model;

  GetAllProductLoaded({required this.model});
}
final class GetAllProductError extends GetAllProductState {
  final String error;

  GetAllProductError({required this.error});
}
