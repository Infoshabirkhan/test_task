import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/Data/model/product_model.dart';
import 'package:test_task/Data/repo/product_repo.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit() : super(GetAllProductInitial());


  getProducts({required int page })async{
    try {
      emit(GetAllProductLoading());
      var data  =await ProductRepo.getProducts(page: page);
      emit(GetAllProductLoaded(model: data));
    }  catch (e) {

      if(e is SocketException){
        emit(GetAllProductNoInternet());
      }else{
        emit(GetAllProductError(error: e.toString()));

      }
      // TODO
    }
  }
}
