import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/login_response.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/pass_response.dart';
import '../model/request/login_request.dart';
import '../model/request/pass_request.dart';
import '../model/request/register_request.dart';

abstract class ApiServices {
  Future<void> registerConsultant(ConsultantRegisterRequest request);

  Future<void> registerFreshGraduate(FreshGraduateRegisterRequest request);

  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordRequest request);

  Future<LoginResponse> login(LoginRequest request);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}
