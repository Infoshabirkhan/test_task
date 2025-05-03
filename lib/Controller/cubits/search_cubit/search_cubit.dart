import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class SearchCubit extends Cubit<String> {
  SearchCubit(super.initialState);


  searchProduct({required String name})async{
    emit(name);
  }
  
  reset(){
    emit('');
  }
}
