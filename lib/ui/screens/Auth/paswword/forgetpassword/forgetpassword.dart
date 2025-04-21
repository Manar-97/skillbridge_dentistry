import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/apptextfield.dart';
import '../verifycode/verifycode.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const String routeName = 'forgetpassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // void _sendOTP() {
  //   if (_formKey.currentState!.validate()) {
  //     final email = _emailController.text.trim();
  //
  //     // TODO: Call your backend API to send OTP to email
  //     // For now, just navigate to VerifyCodeScreen with the email
  //
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => VerifyCode(email: email),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              AppTextField(
                text: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              AppButton(
                text: 'Send OTP',
                onTap: () {
                  Navigator.pushNamed(context, VerifyCode.routeName);
                  //_sendOTP;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
