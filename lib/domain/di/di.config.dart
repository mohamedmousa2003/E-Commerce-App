// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/imple/auth_remote_data_source_impl.dart'
    as _i716;
import '../../data/repository/auth_repository_imple.dart' as _i415;
import '../../features/auth/login/view_model/login_view_model_cubit.dart'
    as _i506;
import '../../features/auth/register/view_model/register_view_model_cubit.dart'
    as _i346;
import '../repository/auth_repository.dart' as _i106;
import '../use_cases/login_usecase.dart' as _i1013;
import '../use_cases/register_usecase.dart' as _i272;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i716.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i106.AuthRepository>(() => _i415.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i272.RegisterUseCase>(() =>
        _i272.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i1013.LoginUseCase>(
        () => _i1013.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i346.RegisterViewModel>(() =>
        _i346.RegisterViewModel(registerUseCase: gh<_i272.RegisterUseCase>()));
    gh.factory<_i506.LoginViewModel>(
        () => _i506.LoginViewModel(loginUseCase: gh<_i1013.LoginUseCase>()));
    return this;
  }
}
