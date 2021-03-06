import 'package:flutter/material.dart';
import 'package:todo_app/backend/services/auth_services.dart';
import 'package:todo_app/frontend/auth/login.dart';

import '../utils/app_constants.dart';
import '../widgets/Text_form_field_widget.dart';
import '../widgets/Text_widget.dart';
import '../widgets/button_widget.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 155, right: 16, left: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppConstants.logoBlue,
                  const SizedBox(
                    height: 16,
                  ),
                  const TextWidget(
                    txt: "Let’s Get Started",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    textColor: AppConstants.titleTextColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextWidget(
                    txt: "Create an new account",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppConstants.subTxtColor,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormFieldWidget(
                    controller: _emailController,
                    minLines: 1,
                    maxLines: 1,
                    hintText: "Your Email",
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppConstants.subTxtColor,
                    ),
                    isPasswordField: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Enter your email ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    minLines: 1,
                    maxLines: 1,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppConstants.subTxtColor,
                    ),
                    isPasswordField: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Enter your password ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonWidget(
                      buttonText: "Sign Up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthServices()
                              .signUpUser(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Message!"),
                                    content: const Text("SignUp successfully"),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Okay"))
                                    ],
                                  );
                                });
                          }).onError((error, stackTrace) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Alert!"),
                                    content: Text(error.toString()),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Okay"))
                                    ],
                                  );
                                });
                          });
                        }
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const TextWidget(
                          txt: "have an account? ",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: AppConstants.subTxtColor,
                        ),
                      ),
                      const TextWidget(
                        txt: "Sign In",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        textColor: AppConstants.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
