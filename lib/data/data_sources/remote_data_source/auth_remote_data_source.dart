import 'package:dartz/dartz.dart';
import 'package:shoppe/domain/entities/LoginResponseEntity.dart';

import '../../../domain/entities/RegisterResonseEntitie.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  // register
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phoneNumber);

  // login
  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  );
}
