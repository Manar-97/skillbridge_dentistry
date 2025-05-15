import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/user.dart';

import '../login_response_entity.dart';

class LoginResponse {
  final String? message;
  final String? token;
  final User? user;

  LoginResponse({this.message, this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        message: json['message'],
        token: json['token'],
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['user'] = user;
    return map;
  }

  LoginResponseEntity toDomain() {
    return LoginResponseEntity(
      message: message,
      token: token,
      user: user?.toDomain(),
    );
  }
}
