import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import '../widgets/Text_form_field_widget.dart';
import '../widgets/Text_widget.dart';
import '../widgets/button_widget.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    txt: "Sign in to continue",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppConstants.subTxtColor,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormFieldWidget(
                    controller: _emailController,
                    hintText: "Your Email",
                    prefixIcon: const Icon(Icons.mail_outline,color: AppConstants.subTxtColor,),
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
                  TextFormFieldWidget(
                    controller: _passwordController,
                    maxLines: 1,
                    minLines: 1,
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline,color: AppConstants.subTxtColor,),
                    isPasswordField: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return " Oops! Your Password Is Not Correct";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ButtonWidget(
                    buttonText: "Sign In",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        return;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppConstants.txtFieldColor,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      const TextWidget(
                        txt: "OR",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        textColor: AppConstants.subTxtColor,
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      Expanded(
                        child: Container(
                          color: AppConstants.txtFieldColor,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppConstants.txtFieldColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/googleicon.png",
                        height: 24,
                        width: 24,
                      ),
                      title: const Center(
                        child: TextWidget(
                          txt: "Login with Google",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          textColor: AppConstants.subTxtColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppConstants.txtFieldColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/facebookicon.png",
                        height: 24,
                        width: 24,
                      ),
                      title: const Center(
                        child: TextWidget(
                          txt: "Login with facebook",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          textColor: AppConstants.subTxtColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextWidget(
                    txt: "Forgot Password?",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    textColor: AppConstants.primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        txt: "Don’t have a account? ",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppConstants.subTxtColor,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const TextWidget(
                          txt: "Register",
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          textColor: AppConstants.primaryColor,
                        ),
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
