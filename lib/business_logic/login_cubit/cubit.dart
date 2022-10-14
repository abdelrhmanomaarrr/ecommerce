import 'package:bloc/bloc.dart';
import 'package:ecommercee/business_logic/login_cubit/states.dart';
import 'package:ecommercee/data/web_services/dio_helper.dart';
import 'package:ecommercee/data/web_services/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin(
  {required String email,
    required String password,
  }
      ){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        }).then((value) {
          print(value.data);
        emit(LoginSuccssesState());
        }).catchError((error){
          emit(LoginErrorState(error.toString()));
    });
  }

}