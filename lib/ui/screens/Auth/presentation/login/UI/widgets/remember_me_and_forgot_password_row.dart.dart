import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/UI/widgets/remember_me_row.dart.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/VM/login_vm.dart';
import '../../../paswword/forgetpassword/forgetpassword.dart';
import '../../VM/login_action.dart';
import '../../VM/login_cubit_state.dart';

class RememberMeAndForgotPasswordRow extends StatelessWidget {
  const RememberMeAndForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginScreenState>(
      listener: (context, state) {
        if (state is NavigateToForgetPasswordScreenState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ForgotPassword()));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RememberMeRow(),
          TextButton(
            onPressed: () {
              loginViewModel.doAction(ForgetPasswordNavigatorAction());
            },
            child: Text(
              'Forget Password',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 12, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
