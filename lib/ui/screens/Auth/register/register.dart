import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/screens/splash_and%20_on_boarding/persona/persona.dart';
import 'package:skillbridge_dentistry/ui/utils/appcolors.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';
import '../../../utils/widgets/apptextfield.dart';
import '../../../utils/widgets/auth_metods.dart';
import '../login/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = 'register';
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _rePass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
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
            AppTextField(
              text: 'Email',
              hintText: 'Enter your email',
              controller: _email,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            AppTextField(
              text: 'Password',
              hintText: 'Enter password',
              controller: _pass,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            AppTextField(
              text: 'Confirm Password',
              hintText: 'Re-Enter password',
              controller: _rePass,
            ),
            CheckboxListTile(
              checkColor: Colors.white,
              activeColor: AppColors.mainColor,
              value: true,
              onChanged: (value) {},
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.only(left: 0, top: 0),
              title: const Text(
                "Remember Me",
                style: TextStyle(
                    color: Color(0xFF898989),
                    fontFamily: "Inter",
                    fontSize: 12),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            AppButton(
                text: 'Sign up',
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, Login.routeName);
                }),
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
                    imageName: 'assets/facebook.png',
                    onTap: () {},
                  ),
                  AuthMethods(
                    imageName: 'assets/google.png',
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
    );
  }
}
