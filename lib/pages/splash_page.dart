import 'dart:async';

import 'package:flutter/material.dart';
import 'package:posresto/pages/on_boarding.dart';
import 'package:posresto/shared/shared_thames.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPages> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingPages(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackgraundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'NARVE-POS',
              style: whiteTextStyle.copyWith(
                fontSize: 34,
                fontWeight: semiBold,
                letterSpacing: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
