import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../Auth/data/model/response/user.dart';
import '../../../Auth/domain/api_result.dart';
import '../../../Auth/domain/repositories/auth_repo.dart';
import 'fresh_graduated_register_event.dart';
import 'fresh_register_cubit_state.dart';

@injectable
class RegisterFreshGraduatedCubit
    extends Cubit<RegisterFreshGraduatedCubitState> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController yearOfGraduation = TextEditingController();
  String university;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepository _authRepo;

  @factoryMethod
  RegisterFreshGraduatedCubit(this._authRepo, this.university)
      : super(InitReg());

  void doEvent(RegisterFreshGraduatedEvent event) {
    switch (event) {
      case SignUpClicked():
        _signUp();
      case SignInClicked():
        _navigateToLogin();
    }
  }

  void emitSate(state) {
    emit(state);
  }

  void _signUp() async {
    if (formKey.currentState!.validate()) {
      emit(LoadingReg());
      final User appUser = User(
        email: email.text,
        username: fullName.text,
      );
      Result<void> result = await _authRepo.freshRegister(
        appUser,
        password.text,
        rePassword.text,
        yearOfGraduation.text,
        university,
      );
      switch (result) {
        case Success():
          {
            emit(HideLoadingDialog());
            emit(SuccessReg());
            Future.delayed(
                const Duration(seconds: 2), () => emit(NavigateToLogin()));
          }
        case ServerFailure<void>():
          emit(HideLoadingDialog());
          emit(FailReg(error: result.message));
      }
    }
  }

  void _navigateToLogin() {
    emit(NavigateToLogin());
    emit(InitReg());
  }

  String? emailValidator(String? val) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val!);
    return emailValid ? null : 'Please enter right email';
  }

  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        if (value.length < 8) {
          return 'password must be \n at least 8 characters';
        } else {
          return 'password should has \n at least \n one lower character ,\n one upper character\n , digit\n and special character';
        }
      } else {
        return null;
      }
    }
  }

  String? validateConfirmPassword(String? value) {
    return password.text == rePassword.text
        ? null
        : 'password and \nconfirm password not \nmatch';
  }

  String? validateEmpty(String? value) {
    return value!.isEmpty ? 'Can not be Empty' : null;
  }
}
