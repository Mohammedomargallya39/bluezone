import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/myText.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {

  RegisterCubit() :super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  String selectedCountry = 'Eg';
  List<DropdownMenuItem<String>>? typeValue = const[
    DropdownMenuItem(value: "Eg", child: myText(title: "مصر", style: Style.extraSmall)),
    DropdownMenuItem(value: "Ku", child: myText(title: "الكويت", style: Style.extraSmall)),
    DropdownMenuItem(value: "Su", child: myText(title: "السعودية", style: Style.extraSmall)),
  ];

  void changeDropDownSelectedCountry(String value){
    selectedCountry = value;
    emit(ChangeDropDownSelectedValueState());
  }

  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    emit(RegisterChangeVisibilityState());
  }

  bool isConfirmPassword = true;

  void changeConfirmPasswordVisibility()
  {
    isConfirmPassword = !isConfirmPassword;
    emit(RegisterChangeVisibilityState());
  }

  bool isChecked = false;

  void changeChecked()
  {
    isChecked = !isChecked;
    emit(RegisterChangeVisibilityState());
  }


}
