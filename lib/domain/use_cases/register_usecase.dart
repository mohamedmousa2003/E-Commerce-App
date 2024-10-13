import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/domain/repository/auth_repository.dart';

import '../entities/RegisterResonseEntitie.dart';
import '../failures.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phoneNumber) {
    return authRepository.register(
        name, email, password, rePassword, phoneNumber);
  }
}
