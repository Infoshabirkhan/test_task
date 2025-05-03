import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class BottomNavCubit extends Cubit<int> {
  BottomNavCubit(super.initialState);

  getIndex({required int index}){
    emit(index);
  }
}
