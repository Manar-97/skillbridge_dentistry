import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecase/login_usecase.dart';
import 'controller_managet.dart';
import 'form_key_manager.dart';
import 'login_action.dart';
import 'login_action_handler.dart';
import 'login_cubit_state.dart';

@injectable
class LoginCubit extends Cubit<LoginScreenState> {
  final ControllersManager controllersManager;
  final FormKeyManager formKeyManager;
  late final LoginActionHandler actionHandler;

  LoginCubit(LoginUseCase loginUseCase)
      : controllersManager = ControllersManager(),
        formKeyManager = FormKeyManager(),
        super(InitialScreenState()) {
    actionHandler = LoginActionHandler(loginUseCase, this);
  }
  bool isObscureText = true;
  TextEditingController getFieldController(String field) {
    return controllersManager.getFieldController(field);
  }

  void setEmailValue(String email) {
    controllersManager.setEmailControllerValue(email);
  }

  void setPasswordValue(String password) {
    controllersManager.setPasswordControllerValue(password);
  }

  GlobalKey<FormState> getLoginFormKey() {
    return formKeyManager.getLoginFormKey();
  }

  void emitState(LoginScreenState state) {
    emit(state);
  }

  void doAction(LoginScreenActions action) {
    actionHandler.handleAction(action);
  }
}
