import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/domain/entities/LoginResponseEntity.dart';
import 'package:shoppe/domain/repository/auth_repository.dart';

import '../failures.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
