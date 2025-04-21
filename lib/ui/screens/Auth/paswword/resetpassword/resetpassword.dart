import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/apptextfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static const String routeName = 'resetpassword';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      final newPassword = _passwordController.text.trim();

      // TODO: Call your backend API to reset password for the email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Reset Successfully')),
      );

      Navigator.popUntil(context, (route) => route.isFirst); // Back to login
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
                'Reset Password',
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
                  text: 'New Password',
                  hintText: 'Enter Your New Password',
                  controller: _passwordController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              AppTextField(
                  text: 'Confirm Password',
                  hintText: 'Enter Confirm Password',
                  controller: _confirmPasswordController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              AppButton(text: 'Reset Password', onTap: _resetPassword),
            ],
          ),
        ),
      ),
    );
  }
}
