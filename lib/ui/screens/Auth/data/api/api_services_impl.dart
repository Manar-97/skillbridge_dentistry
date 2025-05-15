import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/login_response.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/response/pass_response.dart';
import '../model/request/login_request.dart';
import '../model/request/pass_request.dart';
import '../model/request/register_request.dart';
import 'api_services.dart';

@Injectable(as: ApiServices)
class ApiServicesImpl implements ApiServices {
  final Dio _dio;
  String? baseUrl;

  ApiServicesImpl(this._dio, this.baseUrl);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponse _value;
    try {
      _value = LoginResponse.fromJson(_result.data!);
    } on Object catch (e) {
      print(e);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> registerConsultant(ConsultantRegisterRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'register/consultant',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  @override
  Future<void> registerFreshGraduate(
      FreshGraduateRegisterRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'register-freshgraduate',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    await _dio.fetch<void>(_options);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ForgetPasswordRequest>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'forget-password',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ForgetPasswordResponse _value;
    try {
      _value = ForgetPasswordResponse.fromJson(_result.data!);
    } on Object catch (e) {
      print(e.toString());
      rethrow;
    }
    return _value;
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': request.token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<ResetPasswordResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'reset-password',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ResetPasswordResponse _value;
    try {
      _value = ResetPasswordResponse.fromJson(_result.data!);
    } on Object catch (e) {
      print(e.toString());
      rethrow;
    }
    return _value;
  }

  // @override
  // Future<String> logout(String token) async {
  //   final _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final _headers = <String, dynamic>{r'token': token};
  //   _headers.removeWhere((k, v) => v == null);
  //   const Map<String, dynamic>? _data = null;
  //   final _options = _setStreamType<String>(Options(
  //     method: 'GET',
  //     headers: _headers,
  //     extra: _extra,
  //   )
  //       .compose(
  //         _dio.options,
  //         '/logout',
  //         queryParameters: queryParameters,
  //         data: _data,
  //       )
  //       .copyWith(
  //           baseUrl: _combineBaseUrls(
  //         _dio.options.baseUrl,
  //         baseUrl,
  //       )));
  //   final _result = await _dio.fetch<String>(_options);
  //   late String _value;
  //   try {
  //     _value = _result.data!;
  //   } on Object catch (e) {
  //     print(e.toString());
  //     rethrow;
  //   }
  //   return _value;
  // }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
