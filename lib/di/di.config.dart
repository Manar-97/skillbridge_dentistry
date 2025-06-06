// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../ui/screens/Auth/data/api/api_services.dart' as _i766;
import '../ui/screens/Auth/data/api/api_services_impl.dart' as _i578;
import '../ui/screens/Auth/data/repositories/auth_ds/auth_ds.dart' as _i226;
import '../ui/screens/Auth/data/repositories/auth_ds/auth_offline_ds_impl.dart'
    as _i913;
import '../ui/screens/Auth/data/repositories/auth_ds/auth_online_ds_impl.dart'
    as _i457;
import '../ui/screens/Auth/data/repositories/auth_repo_impl.dart' as _i942;
import '../ui/screens/Auth/domain/repositories/auth_repo.dart' as _i285;
import '../ui/screens/Auth/domain/usecase/forget_pass_usecase.dart' as _i542;
import '../ui/screens/Auth/domain/usecase/login_usecase.dart' as _i732;
import '../ui/screens/Auth/domain/usecase/reset_pass_usecase.dart' as _i735;
import '../ui/screens/Auth/presentation/login/VM/login_vm.dart' as _i637;
import '../ui/screens/consultant_flow/register/VM/consultant_register_vm.dart'
    as _i812;
import '../ui/screens/gradueted_flow/register/VM/fresh_register_vm.dart'
    as _i205;

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
    gh.factory<_i766.ApiServices>(() => _i578.ApiServicesImpl(
          gh<_i361.Dio>(),
          gh<String>(),
        ));
    gh.factory<_i226.AuthOfflineDS>(() => _i913.AuthOfflineDSImpl());
    gh.factory<_i226.AuthOnlineDS>(
        () => _i457.AuthOnlineDSImpl(gh<_i766.ApiServices>()));
    gh.factory<_i285.AuthRepository>(() => _i942.AuthRepositoryImpl(
          gh<_i226.AuthOnlineDS>(),
          gh<_i226.AuthOfflineDS>(),
        ));
    gh.factory<_i205.RegisterFreshGraduatedCubit>(
        () => _i205.RegisterFreshGraduatedCubit(
              gh<_i285.AuthRepository>(),
              gh<String>(),
            ));
    gh.factory<_i542.ForgetPasswordUseCase>(
        () => _i542.ForgetPasswordUseCase(gh<_i285.AuthRepository>()));
    gh.factory<_i732.LoginUseCase>(
        () => _i732.LoginUseCase(gh<_i285.AuthRepository>()));
    gh.factory<_i735.ResetPasswordUseCase>(
        () => _i735.ResetPasswordUseCase(gh<_i285.AuthRepository>()));
    gh.factory<_i637.LoginCubit>(
        () => _i637.LoginCubit(gh<_i732.LoginUseCase>()));
    gh.factory<_i812.RegisterConsultantCubit>(
        () => _i812.RegisterConsultantCubit(
              gh<_i285.AuthRepository>(),
              gh<_i497.File>(),
              gh<_i497.File>(),
              gh<String>(),
            ));
    return this;
  }
}
