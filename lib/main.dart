import 'package:flutter/material.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/consultant/consultant.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/dentist/dentist.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/login/login.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/paswword/forgetpassword/forgetpassword.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/paswword/resetpassword/resetpassword.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/paswword/verifycode/verifycode.dart';
import 'package:skillbridge_dentistry/ui/screens/Auth/register/register.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/consul_camera/consul_accepted_case_details.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/consul_camera/consul_case_description/consul_case_description.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/consul_camera/consul_treate_case_details.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/consul_notification/consul_notification.dart';
import 'package:skillbridge_dentistry/ui/screens/consultant_flow/main_consul_screen.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/camera/camera.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/camera/case_description/case_description.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/camera/case_description/not_found_treat_case_details.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/camera/case_details.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/camera/found_treate_case_details.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/home/home.dart';
import 'package:skillbridge_dentistry/ui/screens/gradueted_flow/mains_dentist_creen.dart';
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
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        PersonaScreen.routeName: (_) => const PersonaScreen(),
        Dentist.routeName: (_) => const Dentist(),
        Consultant.routeName: (_) => const Consultant(),
        Register.routeName: (_) => const Register(),
        Login.routeName: (_) => const Login(),
        ForgotPassword.routeName: (_) => const ForgotPassword(),
        ResetPassword.routeName: (_) => const ResetPassword(),
        VerifyCode.routeName: (_) => const VerifyCode(),
        Home.routeName: (_) => const Home(),
        MainDentistScreen.routeName: (_) => const MainDentistScreen(),
        MainConsultantScreen.routeName: (_) => const MainConsultantScreen(),
        CameraCases.routeName: (_) => const CameraCases(),
        CaseDetails.routeName: (_) => const CaseDetails(),
        ConsultantAcceptedCaseDetails.routeName: (_) => const ConsultantAcceptedCaseDetails(),
        FoundTreatCaseDetails.routeName: (_) => const FoundTreatCaseDetails(),
        NotFoundTreatCaseDetails.routeName: (_) => const NotFoundTreatCaseDetails(),
        ConsultantTreatCaseDetails.routeName: (_) => const ConsultantTreatCaseDetails(),
        CaseDescription.routeName: (_) => const CaseDescription(),
        ConsultantCaseDescription.routeName: (_) => const ConsultantCaseDescription(),
        Notifications.routeName: (_) => const Notifications(),
        ConsultantNotifications.routeName: (_) =>
            const ConsultantNotifications(),
      },
      initialRoute: MainConsultantScreen.routeName,
    );
  }
}
