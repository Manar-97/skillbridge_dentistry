import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/base/failures/failures.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/request/pass_request.dart';

import '../../../domain/repositories/auth_repo.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepository authRepository;

  ForgetPasswordCubit(this.authRepository) : super(ForgetPasswordInitial());

  void forgetPassword(ForgetPasswordRequest request) async {
    emit(BaseLoadingState());
    // final result = await authRepository.forgetPassword(request);

    // result.fold(
    //   (failure) => emit(BaseErrorState(failures: failure)),
    //   (response) => emit(BaseSuccessState(response)),
    // );
  }
}

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class BaseLoadingState extends ForgetPasswordState {}

class BaseSuccessState extends ForgetPasswordState {
  final dynamic response;

  BaseSuccessState(this.response);
}

class BaseErrorState extends ForgetPasswordState {
  final failures;

  BaseErrorState({required this.failures});
}
