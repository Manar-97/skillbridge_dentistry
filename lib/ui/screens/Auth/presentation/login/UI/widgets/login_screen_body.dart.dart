import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/UI/widgets/login_button.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/UI/widgets/login_form.dart.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/presentation/login/UI/widgets/remember_me_and_forgot_password_row.dart.dart';
import '../../../../../../utils/dialog_utils.dart';
import '../../VM/login_cubit_state.dart';
import '../../VM/login_vm.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginScreenState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showLoading(context);
        } else if (state is CloseDialog) {
          Navigator.pop(context);
        } else if (state is LoginErrorState) {
          showMessage(context, body: 'Error');
        } else if (state is LoginSuccessState) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> MainDentistScreen(user: state.user!)));
          });
        }
      },
      builder: (BuildContext context, LoginScreenState state) {
        if (state is InitialScreenState) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.getFont('Inter',
                        color: const Color(0xFF5D9F99),
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Text(
                    'Login to your account',
                    style: GoogleFonts.getFont('Inter',
                        color: const Color(0xFF898989),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const LoginForm(),
                  const SizedBox(
                    height: 20,
                  ),
                  const RememberMeAndForgotPasswordRow(),
                  const SizedBox(
                    height: 50,
                  ),
                  const LoginButton(),
                ],
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                'Welcome Back',
                style: GoogleFonts.getFont('Inter',
                    color: const Color(0xFF5D9F99),
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Text(
                'Login to your account',
                style: GoogleFonts.getFont('Inter',
                    color: const Color(0xFF898989),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const LoginForm(),
              const SizedBox(
                height: 16,
              ),
              const RememberMeAndForgotPasswordRow(),
              const SizedBox(
                height: 48,
              ),
              const LoginButton()
            ],
          ),
        );
      },
    );
  }
}
