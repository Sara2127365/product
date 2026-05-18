

import 'package:flutter/material.dart';

import 'package:product/core/styles/color_manager.dart';
import 'package:product/core/styles/styles_manager.dart';
import 'package:product/core/widgets/button_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //hight
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset('assets/onboarding.png'),
          Center(child: SizedBox(height: height * 0.07)),
          Text(
            'Help your path to health \n goals with happiness',
            style: StyleManager.white30Bold,
          ),

          SizedBox(height: height * 0.08),
          ButtonWidget(
            onpress: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
            text: 'Start',
          ),
        ],
      ),
    );
  }
}