import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../VM/consultant_register_cubit_state.dart';
import '../../VM/consultant_register_event.dart';
import '../../VM/consultant_register_vm.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationVm = context.read<RegisterConsultantCubit>();
    return BlocProvider(
        create: (context) => registrationVm,
        child:
            BlocBuilder<RegisterConsultantCubit, RegisterConsultantCubitState>(
                builder: (context, state) {
          ButtonStyle? style = Theme.of(context).elevatedButtonTheme.style;
          if (state is ErrorInField) {
            style = Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStatePropertyAll(Colors.grey[100]));
          }
          return SizedBox(
            child: ElevatedButton(
              style: style,
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (registrationVm.formKey.currentState?.validate() ?? false) {
                  registrationVm.doEvent(SignUpClicked());
                } else {
                  registrationVm.emitSate(ErrorInField());
                }
              },
              child: Text(
                'sign Up',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          );
        }));
  }
}
