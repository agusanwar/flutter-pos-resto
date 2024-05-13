import 'package:flutter/material.dart';
import 'package:posresto/pages/on_boarding.dart';
import 'package:posresto/pages/sign_in_pages.dart';
import 'package:posresto/pages/sign_up_pages.dart';
import 'package:posresto/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => const SplashPages(),
      '/on-boarding': (context) => const OnBoardingPages(),
      '/sign-in': (context) => const SignInPages(),
      '/sign-up': (context) => const SignUpPages(),
    });
  }
}
