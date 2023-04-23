import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yy_new/sign_up_in/sign_button.dart';
import 'package:yy_new/sign_up_in/sign_logo_page.dart';
import 'package:yy_new/sign_up_in/sign_up_input_widget.dart';
class SignModifyPasswordPage extends StatefulWidget {
  const SignModifyPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignModifyPasswordState();
}

class _SignModifyPasswordState extends State<SignModifyPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    log("dispose");
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildPage(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 140, left: 30,
              right: 30,),
            child:ListView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding:const EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.only(top: 5),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Please login to proceed",
                      style:
                      TextStyle(fontSize: 14, color: Color(0xff707070)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 40,
                  ),
                  child: Container(
                      child: SignUpInputWidget(
                        topLabel: "Current Password",
                        placeholder: 'Current Password',
                        controller: passwordController,
                        isPassword: true,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      // left: (MediaQuery.of(context).size.width - 300) / 2,
                      // right: (MediaQuery.of(context).size.width - 300) / 2
                  ),
                  child: Container(
                      width: 300,
                      alignment: Alignment.centerLeft,
                      child: SignUpInputWidget(
                        isPassword: true,
                        topLabel: "New Password",
                        placeholder: 'Enter your new password',
                        controller: newPasswordController,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      // left: (MediaQuery.of(context).size.width - 300) / 2,
                      // right: (MediaQuery.of(context).size.width - 300) / 2
                  ),
                  child: Container(
                      width: 300,
                      alignment: Alignment.centerLeft,
                      child: SignUpInputWidget(
                        isPassword: true,
                        topLabel: "Confirm Password",
                        placeholder: 'Enter your confirm password',
                        controller: confirmPasswordController,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                SignButton(
                    disable: true, title: "Change Password", click: () async {

                }),
              ],
            )
          ),
        ],
      ),
    );
  }
}
