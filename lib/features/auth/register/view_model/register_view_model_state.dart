import 'package:shoppe/domain/entities/RegisterResonseEntitie.dart';
import 'package:shoppe/domain/failures.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  // String errorMessage
  Failures failures;

  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterState {
  // ui call Entity
  RegisterResponseEntity responseEntity;

  RegisterSuccessState({required this.responseEntity});
}
