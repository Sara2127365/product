
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/feature/auth/cubit/cubit_auth.dart';
import 'package:product/feature/auth/cubit/state_auth.dart';
import 'package:product/feature/auth/signup/signup_screen.dart';
import 'package:product/feature/home/home_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8CCFD0),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 60),

                // Title
                const Text(
                  "login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 40),

                // Email Field
                TextField(
                  controller:
                      emailController,
                  decoration:
                      InputDecoration(
                    hintText: "email",
                    prefixIcon:
                        const Icon(
                      Icons.email_outlined,
                    ),
                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Field
                TextField(
                  controller:
                      passwordController,
                  obscureText: true,
                  decoration:
                      InputDecoration(
                    hintText:
                        "password",
                    prefixIcon:
                        const Icon(
                      Icons.key_outlined,
                    ),
                    suffixIcon:
                        const Icon(
                      Icons.visibility_off,
                    ),
                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  12),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // Login Button + Cubit
                BlocConsumer<CubitAuth,
                   StateAuth >(
                  listener:
                      (context, state) {

                    if (state
                        is SuccessStateLogin) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }

                    if (state
                        is FailStateLogin) {

                      print(
                        state.message,
                      );

                      ScaffoldMessenger
                              .of(context)
                          .showSnackBar(
                        SnackBar(
                          content:
                              Text(
                            state.message,
                          ),
                        ),
                      );
                    }
                  },

                  builder:
                      (context, state) {

                    if (state
                        is UploadingStateLogin) {
                      return const Center(
                        child:
                            CircularProgressIndicator(),
                      );
                    }

                    return SizedBox(
                      width:
                          double.infinity,
                      height: 55,
                      child:
                          ElevatedButton(
                        style:
                            ElevatedButton
                                .styleFrom(
                          backgroundColor:
                              const Color(
                                  0xFF001C24),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    14),
                          ),
                        ),

                        onPressed: () {
                          context
                              .read<
                                CubitAuth>()
                              .login(
                                emailController
                                    .text
                                    .trim(),
                                passwordController
                                    .text
                                    .trim(),
                              );
                        },

                        child:
                            const Text(
                          "Login",
                          style:
                              TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors
                                .white,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors
                            .grey
                            .shade600,
                      ),
                    ),

                    const Padding(
                      padding:
                          EdgeInsets.symmetric(
                        horizontal:
                            10,
                      ),
                      child: Text(
                        "Or continue with",
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        color: Colors
                            .grey
                            .shade600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Social Icons
                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [

                    Icon(
                      Icons.g_mobiledata,
                      size: 35,
                    ),

                    SizedBox(
                        width: 20),

                    Icon(
                      Icons.apple,
                      size: 28,
                    ),

                    SizedBox(
                        width: 20),

                    Icon(
                      Icons.facebook,
                      size: 24,
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // Signup
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                  children: [

                    const Text(
                      "Don't have an account? ",
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const SignupScreen(),
                          ),
                        );
                      },

                      child:
                          const Text(
                        "Sign up",
                        style:
                            TextStyle(
                          fontWeight:
                              FontWeight
                                  .bold,
                          color: Colors
                              .black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}