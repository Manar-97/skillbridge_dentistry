import 'package:flutter/material.dart';
import 'package:skillbridge_dentistry/ui/screens/onboarding/onboarding.dart';
import 'package:skillbridge_dentistry/ui/screens/persona/persona.dart';
import 'package:skillbridge_dentistry/ui/screens/splash/splash.dart';

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
        SplashScreen.routName: (_) => const SplashScreen(),
        OnboardingScreen.routName: (_) => const OnboardingScreen(),
        PersonaScreen.routName: (_) => const PersonaScreen(),
      },
      initialRoute: PersonaScreen.routName,    );
  }
}