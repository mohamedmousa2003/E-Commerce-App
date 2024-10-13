import 'package:dartz/dartz.dart';
import 'package:shoppe/domain/entities/LoginResponseEntity.dart';
import 'package:shoppe/domain/entities/RegisterResonseEntitie.dart';
import 'package:shoppe/domain/failures.dart';

abstract class AuthRepository {
  // this function return Failures or RegisterResponseEntity  using dartZ
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phoneNumber);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}

// when call APi --> return success or error ( services or me )
// i want to Function return tow or mor type -->  using package DartZ

/*
"name": "Mousa",
    "email":"Mousa2003@gmail.com",
    "password":"Ahmed@123",
    "rePassword":"Ahmed@123",
    "phone":"01010700701"
 */
