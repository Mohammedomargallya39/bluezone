import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() :super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPersonal = true;

  void changePersonal()
  {
    isPersonal = !isPersonal;
    emit(LoginChangePersonalState());
  }

  bool isPassword = true;

  void changeVisibility()
  {
    isPassword = !isPassword;
    emit(LoginChangeVisibilityState());
  }


}
