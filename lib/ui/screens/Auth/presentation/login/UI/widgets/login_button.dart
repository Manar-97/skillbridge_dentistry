import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/VM/login_vm.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/register/UI/consultant_register.dart';
import '../../../../../../utils/appcolors.dart';
import '../../VM/login_action.dart';
import '../../VM/login_cubit_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginCubit>();
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocConsumer<LoginCubit, LoginScreenState>(
          builder: (context, state) => Column(
                children: [
                  BlocBuilder<LoginCubit, LoginScreenState>(
                      builder: (context, state) {
                    ButtonStyle? style =
                        Theme.of(context).elevatedButtonTheme.style;
                    if (state is EmptyFiledState) {
                      style = Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.copyWith(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.grey[100]));
                    }
                    return SizedBox(
                      child: ElevatedButton(
                        style: style,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (loginViewModel
                                  .getLoginFormKey()
                                  .currentState
                                  ?.validate() ??
                              false) {
                            loginViewModel.doAction(LoginAction());
                          } else {
                            loginViewModel.emitState(EmptyFiledState());
                          }
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't Have An Account",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          loginViewModel.actionHandler
                              .handleAction(ClickedSignUpButton());
                        },
                        child: Text(
                          'signUp',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.mainColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
          listener: (context, state) {
            if (state is NavigateToSignUp) {
              Navigator.pop(context);
              Navigator.pushNamed(context, ConsultantRegister.routeName);
            }
          }),
    );
  }
}
