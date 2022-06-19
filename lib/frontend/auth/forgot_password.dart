import 'package:flutter/material.dart';

import '../../backend/services/auth_services.dart';
import '../utils/app_constants.dart';
import '../widgets/Text_form_field_widget.dart';
import '../widgets/Text_widget.dart';
import '../widgets/button_widget.dart';

class ForgotPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 112, left: 16, right: 16),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppConstants.logoBlue,
                  const SizedBox(
                    height: 16,
                  ),
                  const TextWidget(
                    txt: "Welcome to Lafyuu",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    textColor: AppConstants.titleTextColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextWidget(
                    txt: "Forgot Password?",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppConstants.subTxtColor,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormFieldWidget(
                    controller: _emailController,
                    hintText: "Your Email Here",
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: AppConstants.subTxtColor,
                    ),
                    maxLines: 1,
                    minLines: 1,
                    isPasswordField: false,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Enter Your Email ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ButtonWidget(
                      buttonText: "Submit",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthServices()
                              .forgotPassword(
                                  email: _emailController.text)
                              .then((value) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Message!"),
                                    content: const Text("Check Your Email"),
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
                    height: 21,
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
