// Karim Toson || kareemtoson1@gmail.com || Tue Apr 28 2026 17:52:41
import 'package:flutter/material.dart';

import 'package:product/core/styles/color_manager.dart';
import 'package:product/core/styles/styles_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      //if mounted
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/splash.png')),
          Text('Popular Recipes', style: StyleManager.titleTextStyle),
        ],
      ),
    );
  }
}