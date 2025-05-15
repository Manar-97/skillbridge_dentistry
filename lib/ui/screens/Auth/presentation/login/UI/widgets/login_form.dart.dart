import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/VM/login_vm.dart';
import '../../../../../../utils/appcolors.dart';
import '../../VM/login_action.dart';
import '../../VM/login_cubit_state.dart';
import '../../VM/validate_manager.dart';
import 'custom_input_field.dart.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginCubit>();
    bool isPasswordObscure = loginViewModel.isObscureText;
    List<Color> passwordIconColor = [AppColors.mainColor,Colors.grey];
    Color currentColor = passwordIconColor[isPasswordObscure == false? 0 : 1];
    return BlocListener<LoginCubit, LoginScreenState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          loginViewModel.controllersManager.emailController.text = "";
          loginViewModel.controllersManager.passwordController.text = "";
          ValidateManger.isEmailInputFieldEmpty(
              loginViewModel.controllersManager.emailController.text);
          ValidateManger.isEmailInputFieldEmpty(
              loginViewModel.controllersManager.passwordController.text);
        }
      },
      child: Form(
        key: loginViewModel.getLoginFormKey(),
        child: Column(
          children: [
            CustomInputField(
              hintText: 'Enter your email',
              labelText: 'Email',
              validator: (value) {
                loginViewModel.setEmailValue(value.toString());
                return ValidateManger.isEmailInputFieldEmpty(value);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<LoginCubit,LoginScreenState>(
              builder: (context,state){
                if(state is ChangePasswordVisibilityState){
                  isPasswordObscure = state.isObscureText;
                  currentColor = passwordIconColor[isPasswordObscure == false? 0 : 1];
                }
                return TextFormField(
                  obscureText: isPasswordObscure,
                  controller: loginViewModel.controllersManager.passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: () {
                      loginViewModel.doAction(ChangePasswordVisibilityAction());
                    }, icon:  Icon(Icons.remove_red_eye,color: currentColor,)),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  validator: (value) {
                    return ValidateManger.isPasswordInputFieldEmpty(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}