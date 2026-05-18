import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/feature/auth/cubit/cubit_auth.dart';
import 'package:product/feature/auth/cubit/state_auth.dart';
import 'package:product/feature/auth/login/login_screen.dart';
import 'package:product/feature/auth/signup/signup_screen.dart';
import 'package:product/feature/home/cubit/home_cubit.dart';
import 'package:product/feature/main_navigator/main_navigation.dart';
import 'package:product/feature/onboarding/onboarding.dart';
import 'package:product/feature/splash/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/signup': (context) => BlocProvider(create: (context) =>  CubitAuth(), child:  SignupScreen()),
        '/login': (context) => BlocProvider( create: (context) => CubitAuth(), child: LoginScreen()),
        '/home': (context) => BlocProvider(
          create: (context) => HomeCubit()..getData(),
          child: MainNavigation(),
        ),
      },
    );
  }
}
