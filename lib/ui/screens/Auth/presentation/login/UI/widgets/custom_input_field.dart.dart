import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/VM/login_vm.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final FormFieldValidator<String>? validator;
  const CustomInputField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    LoginCubit viewModel = context.read<LoginCubit>();
    return TextFormField(
      validator: validator,
      controller: viewModel.getFieldController(labelText),
      obscureText: labelText == 'password',
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: Theme.of(context)
            .inputDecorationTheme
            .hintStyle
            ?.copyWith(color: Colors.grey),
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
      ),
    );
  }
}
