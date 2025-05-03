part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesNoInternet extends CategoriesState {}
final class CategoriesLoaded extends CategoriesState {
  final List<CategoriesModel> model;

  CategoriesLoaded({required this.model});
}
final class CategoriesError extends CategoriesState {
  final String error;

  CategoriesError({required this.error});
}
