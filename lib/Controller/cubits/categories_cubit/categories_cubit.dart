import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/Data/model/categories_model.dart';
import 'package:test_task/Data/repo/category_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  getAllCategories()async{
    try {
      emit(CategoriesLoading());

      var response =await CategoryRepo.getAllCategories();
      emit(CategoriesLoaded(model: response));
    }  catch (e) {
   if(e is SocketException){
     emit(CategoriesNoInternet());
   }else{
     emit(CategoriesError(error: e.toString()));
   }
      // TODO
    }

  }
}
