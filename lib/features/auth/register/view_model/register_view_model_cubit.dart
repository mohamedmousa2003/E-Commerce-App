import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/domain/use_cases/register_usecase.dart';
import 'package:shoppe/features/auth/register/view_model/register_view_model_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController(text: "Mohamed Mousa");
  var phoneController = TextEditingController(text: "01285947399");
  var emailController = TextEditingController(text: "mohamedmousa@gmail.com");
  var passwordController = TextEditingController(text: "123456");
  var rePasswordController = TextEditingController(text: "123456");
  var formKey = GlobalKey<FormState>();

  // hold data & handle logic
  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
        (l) => emit(RegisterErrorState(failures: l)),
        (response) => emit(RegisterSuccessState(responseEntity: response)),
      );
    }
  }
}

// view call viewModel
// viewModel call useCase
// useCase call repository
// repository call dataSource
