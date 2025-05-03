import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/Data/model/product_model.dart';
import 'package:test_task/Data/repo/category_repo.dart';

part 'product_by_category_state.dart';

class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit() : super(ProductByCategoryInitial());

  getProducts({required String url })async{
    try {
      emit(ProductByCategoryLoading());

      var model = await CategoryRepo.getProductByCategory(url: url);
      emit(ProductByCategoryLoaded(model: model));
    }  catch (e) {
      // TODO

      if(state is SocketException){
        emit(ProductByCategoryNoInternet());
      }else{
        emit(ProductByCategoryError(error: e.toString()));
      }

    }

  }
}
