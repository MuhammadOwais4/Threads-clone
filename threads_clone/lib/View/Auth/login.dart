import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:threads_clone/routes/routes_names.dart';
import 'package:threads_clone/widgets/auth_button.dart';
import 'package:threads_clone/widgets/auth_header.dart';
import 'package:threads_clone/widgets/auth_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void login() {
    if (_formKey.currentState!.validate()) {
      print("Login");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthHeader(
                      title: "Login",
                      description: "Welcome Back!",
                    ),
                    AuthTextField(
                      validator: ValidationBuilder().required().email().build(),
                      labelText: "Email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    AuthTextField(
                      validator: ValidationBuilder().required().build(),
                      labelText: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    AuthButton(
                      label: "Login",
                      onPressed: login,
                    ),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(
                                  RoutesNames.register,
                                );
                              },
                          ),
                        ],
                        text: "Don't have an account?\t",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
