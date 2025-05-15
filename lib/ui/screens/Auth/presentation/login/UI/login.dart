import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/UI/widgets/login_screen_body.dart.dart';
import '../../../../../../di/di.dart';
import '../VM/login_vm.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const String routeName = 'login';
  final LoginCubit viewModel = getIt.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: const Scaffold(
        body: SafeArea(child: LoginScreenBody()),
      ),
    );
  }
}
