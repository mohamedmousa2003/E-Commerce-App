import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/domain/use_cases/login_usecase.dart';
import 'package:shoppe/features/auth/login/view_model/login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  var emailController = TextEditingController(text: "mohamedmousa@gmail.com");
  var passwordController = TextEditingController(text: "123456");
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        (l) => emit(LoginErrorState(failures: l)),
        (response) => emit(LoginSuccessState(loginResponseEntity: response)),
      );
    }
  }
}
