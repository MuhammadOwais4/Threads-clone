import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:threads_clone/controllers/auth_controller.dart';
import 'package:threads_clone/routes/routes_names.dart';
import 'package:threads_clone/widgets/auth_button.dart';
import 'package:threads_clone/widgets/auth_header.dart';
import 'package:threads_clone/widgets/auth_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());

  void submit() {
    if (_formKey.currentState!.validate()) {
      controller.register(nameController.text, passwordController.text, emailController.text);
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
                      title: "Register",
                      description: "Welcome To Threds World",
                    ),
                    AuthTextField(
                      validator: ValidationBuilder()
                          .required("Name is required. Please enter your name.")
                          .minLength(3)
                          .maxLength(20)
                          .build(),
                      labelText: "Name",
                      obscureText: false,
                      controller: nameController,
                    ),
                    AuthTextField(
                      validator: ValidationBuilder()
                          .required("Email is required. Please enter your Email.")
                          .email("Please enter a valid email address.")
                          .build(),
                      labelText: "Email",
                      obscureText: false,
                      controller: emailController,
                    ),
                    AuthTextField(
                      validator: ValidationBuilder()
                          .required(
                              "Password is required. Please enter your password.")
                          .regExp(
                            RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                            "A minimum 8 characters password contains a combination of uppercase and lowercase letter and number are required.",
                          )
                          .build(),
                      labelText: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    AuthTextField(
                      validator: (arg) {
                        if (passwordController.text != arg) {
                          return "Password does not match confirm password";
                        }
                        return null;
                      },
                      labelText: "Confirm Password",
                      obscureText: true,
                      controller: confirmPasswordController,
                    ),
                    AuthButton(
                      label: "Register",
                      onPressed: submit,
                    ),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(
                                  RoutesNames.login,
                                );
                              },
                          ),
                        ],
                        text: "Already have an account?\t",
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
