import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/core/widgets/shared_preference_utils.dart';
import 'package:shoppe/data/api_manager.dart';
import 'package:shoppe/data/end_point.dart';
import 'package:shoppe/data/model/login_response_dto%20.dart';
import 'package:shoppe/data/model/register_response_dto.dart';
import 'package:shoppe/domain/entities/LoginResponseEntity.dart';

import '../../../../domain/failures.dart';
import '../auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phoneNumber) async {
    try {
      // // to check internet
      // var checkResult = await Connectivity().checkConnectivity();
      // if(checkResult == ConnectivityResult.wifi ||
      //  checkResult == ConnectivityResult.mobile
      // ){
      var response = await apiManager.postData(EndPoint.register, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phoneNumber
      });
// convert json to object
      var registerResponse = RegisterResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
      // }else{
      // //   // no internet
      //   return Left(NetworkError(errorMessage: noInternet));
      // }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

////////////////////////////////////////////////////////////////////////
// login
  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    try {
      // // to check internet
      // var checkResult = await Connectivity().checkConnectivity();
      // if(checkResult == ConnectivityResult.wifi ||
      //  checkResult == ConnectivityResult.mobile
      // ){
      var response = await apiManager.postData(EndPoint.login, body: {
        "email": email,
        "password": password,
      });
// convert json to object
      var loginResponse = LoginResponseDto.fromJson(response.data);
// save token (SharedPreferences)
      SharedPreferenceUtils.saveData(key: "token", value: loginResponse.token);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message!));
      }
      // }else{
      // //   // no internet
      //   return Left(NetworkError(errorMessage: noInternet));
      // }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
