import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:test_task/Data/model/product_model.dart';


class FavouriteCubit extends Cubit<List<Product>> {
  FavouriteCubit(super.initialState);

  static List<Product> favouriteList  = [];

  addToFav({required Product product}){
    favouriteList.add(product);
   List<Product> refreshList = List.from(favouriteList);
   print('===${refreshList}');
Fluttertoast.showToast(msg: "Added to Favourite");
   emit(refreshList);
  }

  removeFromFavourite({required Product product}){

    print('===${favouriteList.contains(product)}');

    for (var x in favouriteList) {

      if(x.id == product.id){
      var index =   favouriteList.indexOf(x);
      favouriteList.removeAt(index);
        List<Product> refreshList = List.from(favouriteList);
        print('===${refreshList}');
        Fluttertoast.showToast(msg: "Removed from Favourite");

        emit(refreshList);
        break;
      }
    }

  }
}
