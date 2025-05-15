import 'dart:io';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/login_response.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/pass_response.dart';
import '../../../domain/api_result.dart';
import '../../model/request/pass_request.dart';
import '../../model/response/user.dart' as domain;

abstract class AuthOnlineDS {
  Future<Result<void>> registerConsultant(
      domain.User appUser,
      String password,
      String confirmPassword,
      File resumePath,
      File photoPath,
      String yearOfGraduation,
      String department,
      String biography);

  Future<Result<void>> registerFreshGraduate(
      domain.User appUser,
      String password,
      String confirmPassword,
      String yearOfGraduation,
      String university);

  Future<ForgetPasswordResponse> forgetPassword(String email);

  Future<LoginResponse> login(String email, String password);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}

abstract class AuthOfflineDS {
  Future<void> saveToken(String token);
  Future<void> deleteToken();
  Future<String> getToken();
}
