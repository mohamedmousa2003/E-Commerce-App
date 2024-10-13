import 'package:shoppe/domain/entities/LoginResponseEntity.dart';
import 'package:shoppe/domain/failures.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  // String errorMessage
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginState {
  // ui call Entity
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
