import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/Data/repo/product_repo.dart';

import '../../../Data/model/product_model.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  getDetail({required int id})async{
    try {
      emit(ProductDetailLoading());
      var data  =await ProductRepo.getProductById(id: id);
      emit(ProductDetailLoaded(model: data));
    }  catch (e) {
      // TODO
    emit(ProductDetailError(error: e.toString()));
    }


  }
}
