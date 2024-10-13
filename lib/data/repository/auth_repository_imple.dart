import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:shoppe/domain/entities/LoginResponseEntity.dart';
import 'package:shoppe/domain/entities/RegisterResonseEntitie.dart';
import 'package:shoppe/domain/failures.dart';
import 'package:shoppe/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  // register
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phoneNumber) async {
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phoneNumber);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  //login
  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await authRemoteDataSource.login(email, password);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
