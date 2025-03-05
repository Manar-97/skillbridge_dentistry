import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/register/register.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import '../../../../utils/widgets/apptextfield.dart';
import '../../../../utils/widgets/auth_metods.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = 'login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
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
             AppTextField(
              text: 'Email',
              hintText: 'Enter your email', controller: _email,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
             AppTextField(
              text: 'Password',
              hintText: 'Enter password', controller: _pass,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            GestureDetector(
              onTap: () {},
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forget Password?',
                  style: GoogleFonts.getFont('Inter',
                      color: const Color(0xFF5D9F99),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            AppButton(text: 'Sign in', onTap: () {}),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Color(0xFF898989),
                    thickness: 1,
                    height: 1,
                  ),
                ),
                Text(
                  ' or continue with ',
                  style: GoogleFonts.getFont('Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color(0xFF13122B)),
                ),
                const Expanded(
                  child: Divider(
                    color: Color(0xFF898989),
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AuthMethods(
                    imageName: 'assets/logos_facebook.png',
                    onTap: () {},
                  ),
                  AuthMethods(
                    imageName: 'assets/logos_google.png',
                    onTap: () {},
                  ),
                  AuthMethods(
                    imageName: 'assets/logos_iphone.png',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.getFont('Inter',
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Register.routeName);
                  },
                  child: Text(
                    ' Sign up',
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
    );
  }
}
