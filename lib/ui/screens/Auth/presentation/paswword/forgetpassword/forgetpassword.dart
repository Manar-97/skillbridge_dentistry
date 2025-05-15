import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import '../../../../../../di/di.dart';
import '../../../../../utils/dialog_utils.dart';
import '../../../../../utils/validators.dart';
import '../../../../../utils/widgets/apptextfield.dart';
import '../../../data/model/request/pass_request.dart';
import '../verifycode/verifycode.dart';
import 'forgetpassword_vm.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const String routeName = 'forgetpassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController e_mail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ForgetPasswordCubit cubit = getIt();

  void _sendResetRequest() {
    if (_formKey.currentState!.validate()) {
      final email = e_mail.text.trim();
      final request = ForgetPasswordRequest(email: email);

      cubit.forgetPassword(request); // Pass the request object to the cubit
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is BaseLoadingState) {
            showLoading(context);
          } else if (state is BaseSuccessState) {
            hideLoading(context);
            Navigator.pushNamed(context, VerifyCode.routeName,
                arguments: e_mail.text.trim());
          } else if (state is BaseErrorState) {
            hideLoading(context);
            showMessage(context,
                body: state.failures.errorMessage, posButtonTitle: "OK");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter your email to\nreceive an OTP',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                BuildTextField(
                  hint: 'enter your email',
                  label: 'E-mail',
                  textInputType: TextInputType.emailAddress,
                  validation: AppValidators.validateEmail,
                  controller: e_mail,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                AppButton(
                  text: 'Send OTP',
                  onTap: _sendResetRequest,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
