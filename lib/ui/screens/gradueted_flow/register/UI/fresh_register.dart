import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/data/model/request/register_request.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/register/UI/widgets/fresh_graduated_signup_button.dart';
import '../../../../../di/di.dart';
import '../../../../utils/core/assets_manager.dart';
import '../../../../utils/validators.dart';
import '../../../../utils/widgets/apptextfield.dart';
import '../../../../utils/widgets/dialogs.dart';
import '../../../Auth/data/repositories/auth_ds/auth_ds.dart';
import '../../../Auth/presentation/login/UI/login.dart';
import '../../../consultant_flow/register/VM/consultant_register_cubit_state.dart';
import '../VM/fresh_register_vm.dart';

class FreshGraduatedRegister extends StatefulWidget {
  const FreshGraduatedRegister({super.key});
  static const String routeName = 'register';
  @override
  State<FreshGraduatedRegister> createState() => _FreshGraduatedRegisterState();
}

class _FreshGraduatedRegisterState extends State<FreshGraduatedRegister> {
  final RegisterFreshGraduatedCubit registerFreshGraduatedCubit =
      getIt.get<RegisterFreshGraduatedCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerFreshGraduatedCubit,
      child: BlocConsumer(
        listener: (context, state) {
          if (state is FailReg) {
            Dialogs.alertDialog(
                message: state.error ?? "",
                animation: Lottie.asset(AnimationAssets.error),
                negativeAction: () {
                  Navigator.pop(context);
                },
                negativeFeedback: 'OK',
                context: context);
          } else if (state is NavigateToLogin) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
          } else if (state is SuccessReg) {
            Dialogs.successDialog(context: context);
          } else if (state is HideLoadingDialog) {
            Navigator.pop(context);
          } else if (state is LoadingReg) {
            Dialogs.loading(context: context);
          }
        },
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: registerFreshGraduatedCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: GoogleFonts.getFont('Inter',
                        color: const Color(0xFF5D9F99),
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Text(
                    'Create your new account',
                    style: GoogleFonts.getFont('Inter',
                        color: const Color(0xFF898989),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  BuildTextField(
                    hint: 'enter your email',
                    label: 'E-mail',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    controller: registerFreshGraduatedCubit.email,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  BuildTextField(
                    hint: 'enter your password',
                    label: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    validation: AppValidators.validatePassword,
                    controller: registerFreshGraduatedCubit.password,
                    isObscured: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  BuildTextField(
                    hint: 'confirm your password',
                    label: 'Re_enter Password',
                    textInputType: TextInputType.visiblePassword,
                    validation: AppValidators.validatePassword,
                    controller: registerFreshGraduatedCubit.rePassword,
                    isObscured: true,
                  ),
                  BuildTextField(
                    backgroundColor: Colors.white,
                    hint: 'enter your name',
                    label: 'Full Name',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateFullName,
                    controller: registerFreshGraduatedCubit.fullName,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  BuildTextField(
                    backgroundColor: Colors.white,
                    hint: 'enter your answer',
                    label: 'Years of Graduation',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    controller: registerFreshGraduatedCubit.yearOfGraduation,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'University',
                      style: GoogleFonts.getFont('Inter',
                          color: const Color(0xFF717070),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: registerFreshGraduatedCubit.university,
                    items: ['MUST', 'O6U', 'Elahram', 'Other']
                        .map((university) => DropdownMenuItem(
                            value: university, child: Text(university)))
                        .toList(),
                    onChanged: (value) => setState(
                        () => registerFreshGraduatedCubit.university = value!),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const SignUpButton(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.getFont('Inter',
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Login.routeName);
                        },
                        child: Text(
                          ' Sign in',
                          style: GoogleFonts.getFont('Inter',
                              color: const Color(0xFF5D9F99),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
