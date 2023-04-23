import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yy_new/sign_up_in/sign_button.dart';
import 'package:yy_new/sign_up_in/sign_logo_page.dart';
import 'package:yy_new/sign_up_in/sign_request.dart';
import 'package:yy_new/sign_up_in/sign_reset_password_page.dart';
import 'package:yy_new/sign_up_in/sign_social_widget.dart';
import 'package:yy_new/sign_up_in/sign_up.dart';
import 'package:yy_new/sign_up_in/sign_up_input_widget.dart';
import '../utils/cache.dart';
import '../utils/http_manager.dart';
import '../utils/navigator_util.dart';
import '../utils/toast.dart';
import '../utils/verify_util.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isRemember = true;
  bool _isShow = false;

  @override
  void initState() {
    super.initState();
    showSocialMedia();
    loadEmail();
    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    //   log("google sign in accout ----.>>>$account");
    // });
    // _googleSignIn.signInSilently();
  }

  @override
  void didUpdateWidget(covariant SignInPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadEmail();
  }

  @override
  void dispose() {
    super.dispose();
    log("dispose");
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
        child: Container(
          margin: EdgeInsets.only(top: 0),
          decoration: const BoxDecoration(
              color: Color(0xff00BEBE),
              image: DecorationImage(
                  image: AssetImage("imgs/onboarding-bg.png"),
                  fit: BoxFit.fill)),
          height: MediaQuery.of(context).size.height -
              150 +
              MediaQuery.of(context).padding.bottom +
              MediaQuery.of(context).padding.top,
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 140),
                child: Container(
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withAlpha(80),
                            blurRadius: 50.0,
                            offset: Offset(0, -40),
                            spreadRadius: -11)
                      ]),
                  child: ListView(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Please login to proceed",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff707070)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 40,
                            left: (MediaQuery.of(context).size.width - 300) / 2,
                            right:
                                (MediaQuery.of(context).size.width - 300) / 2),
                        child: Container(
                            child: SignUpInputWidget(
                          topLabel: "Email Address",
                          placeholder: 'Enter your email',
                          controller: emailController,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20,
                            left: (MediaQuery.of(context).size.width - 300) / 2,
                            right:
                                (MediaQuery.of(context).size.width - 300) / 2),
                        child: Container(
                            width: 300,
                            alignment: Alignment.centerLeft,
                            child:
                                // TextField(
                                //   controller: passwordController,
                                //   decoration: InputDecoration(
                                //       hintText: "Password",
                                //       hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3))),
                                // ),
                                SignUpInputWidget(
                              isPassword: true,
                              topLabel: "Password",
                              placeholder: 'Enter your password',
                              controller: passwordController,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, top: 30, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                log("remember me");
                                setState(() {
                                  _isRemember = !_isRemember;
                                });
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    _isRemember
                                        ? "imgs/checkbox-checked.png"
                                        : "imgs/checkbox.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Remember me",
                                      style: TextStyle(
                                          color: Color(0xff707070),
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                log("forgot password");
                                NavigatorUtil.push(
                                    context, SignResetPasswordPage());
                                // var r = await AuthorizeRequest.authenticate();
                              },
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                height: 20,
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Color(0xffFF9D00), fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SignButton(
                          disable: true,
                          title: "SIGN IN",
                          click: () async {
                            log("login email${emailController.text} password ${passwordController.text}");
                            if (!VerifyUtil.isEmail(emailController.text)) {
                              showErrorText(
                                  "please,input correct email address");
                            } else if (passwordController.text.length < 6) {
                              showErrorText("please,input correct password");
                            } else {
                              updateSaveEmail();
                              // var model = await SignRequest.login(
                              //     emailController.text,
                              //     passwordController.text);
                              // if (null != model) {
                              //   Navigator.of(context).pushAndRemoveUntil(
                              //       MaterialPageRoute(builder: (_) {
                              //     return Container();
                              //   }), (route) => false);
                              // }
                            }
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Platform.isIOS && !_isShow
                            ? Container()
                            : SocialSignPage(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                    text: "Don’t have an account? ",
                                    style: TextStyle(color: Color(0xff707070))),
                                TextSpan(
                                    text: "Sign Up ",
                                    style: TextStyle(color: Color(0xffFF9D00)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        NavigatorUtil.push(
                                            context, SignUpPage());
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: SignLogoPage(),
                left: (MediaQuery.of(context).size.width - 110) / 2,
                top: 70,
              ),
            ],
          ),
        ));
  }

  void loadEmail() async {
    try {
      // bool remember = await Cache.getInstance().get("isRemember");
      String username = "";
      String password = "";
      bool remember;
      if (Platform.isIOS) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        username = sharedPreferences.get("email") as String;
        password = sharedPreferences.get("password") as String;
        remember = sharedPreferences.getBool("isRemember") as bool;
      } else {
        username = await Cache.getInstance().get("email");
        password = await Cache.getInstance().get("password");
        remember = await Cache.getInstance().get("isRemember");
      }
      setState(() {
        log("is remember $remember");
        _isRemember = remember;
        emailController.text = username;
        passwordController.text = password;
        if (remember == true) {
        } else {
          passwordController.clear();
        }
      });
      log("loading  email:$username and pwd $password ");
    } catch (e) {
      log("load user email is error $e");
    }
  }

  void updateSaveEmail() async {
    try {
      log("update is remember $_isRemember");
      if (Platform.isIOS) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString("email", emailController.text);
        await sharedPreferences.setString("password", passwordController.text);
        await sharedPreferences.setBool("isRemember", _isRemember);
      } else {
        await Cache.getInstance().setBool("isRemember", _isRemember);
        await Cache.getInstance().setString("email", emailController.text);
        await Cache.getInstance()
            .setString("password", passwordController.text);
      }
    } catch (e) {
      log("delete user email is error $e");
    }
  }

  Future showSocialMedia() async {
    var r = await HttpManager.get(url: "user/getShowSocialMedia");
    log("show social media info res ------>>>>$r");
    if (mounted && r["data"] != null) {
      setState(() {
        _isShow = num.parse(r["data"]["show"] ?? "0") == 1;
        log("is shwo --->>>$_isShow");
      });
    }
  }
}
