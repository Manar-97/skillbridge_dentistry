import 'dart:io';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/login_response_entity.dart';
import '../../data/model/response/pass_response.dart';
import '../../data/model/response/user.dart' as domain;
import '../api_result.dart';

abstract class AuthRepository {
  Future<Result<LoginResponseEntity>> login(String email, String password);

  Future<Result<void>> freshRegister(domain.User appUser, String password,
      String confirmPassword, String yearOfGraduation, String university);
  Future<Result<void>> consultantRegister(
      domain.User appUser,
      String password,
      String confirmPassword,
      File resumePath,
      File photoPath,
      String yearOfGraduation,
      String department,
      String biography);
  Future<Result<ForgetPasswordResponseEntity>> forgetPassword(String email);
  Future<Result<ResetPasswordResponseEntity>> resetPassword(
      String rePassword, String newPassword);
}
