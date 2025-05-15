import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/VM/login_vm.dart';
import '../../VM/login_action.dart';
import '../../VM/login_cubit_state.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit viewModel = context.read<LoginCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<LoginCubit, LoginScreenState>(builder: (context, state) {
          bool isChecked = false;
          if (state is RememberMeBoxCheckedState) {
            isChecked = state.isChecked;
          }
          return Checkbox(
            value: isChecked,
            onChanged: (value) {
              viewModel.doAction(
                CheckedBoxAction(value ?? false),
              );
            },
          );
        }),
        Text(
          'Remember Me',
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 13),
        )
      ],
    );
  }
}
