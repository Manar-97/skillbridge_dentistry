import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/screens/splash_and_onboarding/persona/persona.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});
  static const String routeName = 'verifycode';

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final _formKey = GlobalKey<FormState>();

  void _verifyCode() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call backend to verify the code (API call)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Code verified successfully!')),
      );
      // Navigate to reset password screen if needed
    }
  }

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
                'Check your email',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'We sent code, please enter it',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Inter',
                    fontSize: 16, color: const Color(0xFF929292)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              OtpTextField(
                borderRadius: BorderRadius.circular(4),
                numberOfFields: 4,
                fieldHeight: 45,
                fieldWidth: 55,
                borderColor: const Color(0xFF929292),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haven’t got the email yet?',
                    style: GoogleFonts.getFont('Inter',
                        color: const Color(0xFF929292),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PersonaScreen.routeName);
                    },
                    child: Text(
                      ' Resend code',
                      style: GoogleFonts.getFont('Inter',
                          color: const Color(0xFF5D9F99),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              AppButton(
                text: 'Verify Code',
                onTap: _verifyCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
