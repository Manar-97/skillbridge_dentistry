class ForgetPasswordResponse {
  String? message;
  String? status;

  ForgetPasswordResponse({this.message, this.status});
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      message: json['message'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };

  ForgetPasswordResponseEntity toDomain() {
    return ForgetPasswordResponseEntity(
      message: status,
    );
  }
}

class ForgetPasswordResponseEntity {
  final String? message;

  ForgetPasswordResponseEntity({this.message});
}

class ResetPasswordResponse {
  String? status;

  ResetPasswordResponse({
    this.status,
  });

  Map<String, dynamic> toJson() => {
        'status': status,
      };
  ResetPasswordResponseEntity toDomain() {
    return ResetPasswordResponseEntity(message: status);
  }

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      status: json['status'],
    );
  }
}

class ResetPasswordResponseEntity {
  final String? message;

  ResetPasswordResponseEntity({this.message});
}
