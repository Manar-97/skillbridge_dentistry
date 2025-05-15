import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/login_response_entity.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/request/pass_request.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/pass_response.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/domain/api_result.dart';
import '../../domain/repositories/auth_repo.dart';
import '../api/excute_api.dart';
import '../model/response/user.dart' as domain;
import 'auth_ds/auth_ds.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthOnlineDS authOnlineDS;
  AuthOfflineDS authOfflineDS;
  AuthRepositoryImpl(this.authOnlineDS, this.authOfflineDS);

  @override
  Future<Result<LoginResponseEntity>> login(
      String email, String password) async {
    return executeApiCall<LoginResponseEntity>(() async {
      var response = await authOnlineDS.login(email, password);
      await authOfflineDS.saveToken(response.token!);
      return response.toDomain();
    });
  }

  @override
  Future<Result<void>> consultantRegister(
      domain.User appUser,
      String password,
      String confirmPassword,
      File resumePath,
      File photoPath,
      String yearOfGraduation,
      String department,
      String biography) {
    return authOnlineDS.registerConsultant(appUser, password, confirmPassword,
        resumePath, photoPath, yearOfGraduation, department, biography);
  }

  @override
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(
      String email) async {
    return executeApiCall<ForgetPasswordResponseEntity>(() async {
      var response = await authOnlineDS.forgetPassword(email);
      return response.toDomain();
    });
  }

  @override
  Future<Result<void>> freshRegister(domain.User appUser, String password,
      String confirmPassword, String yearOfGraduation, String university) {
    return authOnlineDS.registerFreshGraduate(
        appUser, password, confirmPassword, yearOfGraduation, university);
  }

  @override
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      String rePassword, String newPassword) async {
    String token = await authOfflineDS.getToken();
    return executeApiCall<ResetPasswordResponseEntity>(() async {
      var response = await authOnlineDS.resetPassword(ResetPasswordRequest(
          newPassword: newPassword, confirmPassword: rePassword));
      await authOfflineDS.saveToken(token ?? "");
      return response.toDomain();
    });
  }
}
