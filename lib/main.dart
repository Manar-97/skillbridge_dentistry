import 'package:flutter/material.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/dentist/dentist.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/login/login.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/paswword/forgetpassword/forgetpassword.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/paswword/resetpassword/resetpassword.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/paswword/verifycode/verifycode.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/Auth/register/register.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/home/home.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/mainscreen.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/notification/notification.dart';
import 'package:skillbridge_dentistry/ui/screens/splash_and%20_on_boarding/onboarding/onboarding.dart';
import 'package:skillbridge_dentistry/ui/screens/splash_and%20_on_boarding/persona/persona.dart';
import 'package:skillbridge_dentistry/ui/screens/splash_and%20_on_boarding/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        PersonaScreen.routeName: (_) => const PersonaScreen(),
        Dentist.routeName: (_) => const Dentist(),
        Register.routeName: (_) => const Register(),
        Login.routeName: (_) => const Login(),
        ForgotPassword.routeName: (_) => const ForgotPassword(),
        ResetPassword.routeName: (_) => const ResetPassword(),
        VerifyCode.routeName: (_) => const VerifyCode(),
        Home.routeName: (_) => const Home(),
        MainScreen.routeName: (_) => const MainScreen(),
        Notifications.routeName: (_) => const Notifications(),
      },
      initialRoute: MainScreen.routeName,
    );
  }
}
