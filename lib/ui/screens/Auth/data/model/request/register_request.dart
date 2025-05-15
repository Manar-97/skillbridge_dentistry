// auth_requests.dart
import 'package:dio/dio.dart';

class ConsultantRegisterRequest {
  String? fullName;
  String? email;
  String? password;
  String? rePassword;
  String? resumePath;
  String? yearOfExperience;
  String? department;
  String? biography;
  String? photoPath;

  ConsultantRegisterRequest({
    this.fullName,
    this.email,
    this.password,
    this.rePassword,
    this.resumePath,
    this.yearOfExperience,
    this.department,
    this.biography,
    this.photoPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'email': email,
      'Password': password,
      'rePassword': rePassword,
      'ResumeLink':
          MultipartFile.fromFileSync(resumePath!, filename: 'resume.pdf'),
      'yearOfExperience': yearOfExperience.toString(),
      'Department': department,
      'ShortBiography': biography,
      'Photo': MultipartFile.fromFileSync(photoPath!, filename: 'photo.jpg'),
    };
  }
}

class FreshGraduateRegisterRequest {
  String? fullName;
  String? email;
  String? password;
  String? rePassword;
  String? yearOfGraduation;
  String? university;
  // String department;

  FreshGraduateRegisterRequest({
    this.fullName,
    this.email,
    this.password,
    this.rePassword,
    this.yearOfGraduation,
    this.university,
    // required this.department,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'yearOfGraduation': yearOfGraduation,
        'university': university,
        // 'department': department,
      };
}
