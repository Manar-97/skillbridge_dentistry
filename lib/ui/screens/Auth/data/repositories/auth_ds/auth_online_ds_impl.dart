import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/api/api_services.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/api/excute_api.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/request/login_request.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/request/pass_request.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/request/register_request.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/login_response.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/pass_response.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/domain/api_result.dart';
import '../../model/response/user.dart' as domain;
import 'auth_ds.dart';

@Injectable(as: AuthOnlineDS)
class AuthOnlineDSImpl implements AuthOnlineDS {
  final ApiServices _apiServices;

  AuthOnlineDSImpl(this._apiServices);
  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) {
    return _apiServices.forgetPassword(ForgetPasswordRequest(email: email));
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    return _apiServices.login(LoginRequest(email: email, password: password));
  }

  @override
  Future<Result<void>> registerConsultant(
    domain.User appUser,
    String password,
    String confirmPassword,
    File resumePath,
    File photoPath,
    String yearOfExperience,
    String department,
    String biography,
  ) async {
    return await executeApiCall<void>(() async {
      final ConsultantRegisterRequest request = ConsultantRegisterRequest(
        rePassword: confirmPassword,
        password: password,
        email: appUser.email,
        yearOfExperience: yearOfExperience,
        department: department,
        fullName: appUser.username,
        biography: biography,
        photoPath: photoPath.path,
        resumePath: resumePath.path,
      );
      await _apiServices.registerConsultant(request);
      return;
    });
  }

  @override
  Future<Result<void>> registerFreshGraduate(
    domain.User appUser,
    String password,
    String confirmPassword,
    String yearOfGraduation,
    String university,
  ) async {
    {
      return await executeApiCall<void>(() async {
        final FreshGraduateRegisterRequest request =
            FreshGraduateRegisterRequest(
          rePassword: confirmPassword,
          password: password,
          email: appUser.email,
          yearOfGraduation: yearOfGraduation,
          fullName: appUser.username,
          university: university,
        );
        await _apiServices.registerFreshGraduate(request);
        return;
      });
    }
  }

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request) {
    return _apiServices.resetPassword(request);
  }
}
