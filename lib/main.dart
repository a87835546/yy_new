import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yy_new/sign_up_in/sign_in.dart';
import 'package:yy_new/utils/app_singleton.dart';
import 'package:yy_new/utils/constants.dart';
import 'package:yy_new/utils/size_fit.dart';
import 'package:yy_new/utils/user_provider.dart';

import 'bottom_navigationbar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppSingleton.devMode = DevMode.product;
  TLSizeFit.initialize();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserLoginProviderModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool login = false;
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<UserInfoModel> snapshot) {
        if ((snapshot.hasError || snapshot.data == null) && kIsWeb == false) {
          log("loading local data error ${snapshot.error}");
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("error ${snapshot.error}"),
              ),
            ),
          );
        } else {
          UserInfoModel? model = snapshot.data;

          Future.delayed(const Duration(seconds: 0)).then((onValue) {
            BuildContext? context = navigatorKey.currentState?.overlay?.context;
            // AppSingleton.currentPage = context;
          });
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: MaterialApp(
              navigatorKey: navigatorKey,
              title: 'Resiklos',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: ResiklosTypography.dark,
                fontFamily: 'Montserrat',
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    color: ResiklosColors.textColor,
                    fontSize: 12,
                  ),
                  bodyText2: TextStyle(
                    color: ResiklosColors.textColor,
                    fontSize: 12,
                  ),
                  button: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  subtitle1: TextStyle(
                    color: ResiklosColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle2: TextStyle(
                    color: ResiklosColors.textColor,
                    fontSize: 12,
                  ),
                ),
                scaffoldBackgroundColor: ResiklosColors.background,
              ),
              home:
                  login == false ?
              const CustomBottomNavigationBar():
              const SignInPage(),
              builder: EasyLoading.init(),
            ),
          );
        }
      },
      future: readData(),
    );
  }

  Future<UserInfoModel> readData() async {
    if (Platform.isIOS) {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      var s = sharedPreferences.get("userinfo");
      // log("sharedPreferences get user $s");
      if (s != null && s is String) {
        Map<String, dynamic> map = json.decode(s);
        UserInfoModel model = UserInfoModel.fromJson(map);
        log("ios loading local data res --->>>$model");
        return Future.value(model);
      } else {
        return Future.value(UserInfoModel());
      }
    } else if (Platform.isAndroid) {
      // var re = await AppSingleton.getUserInfoModel();
      // re ??= UserInfoModel();
      return Future.value(null);
    } else if (kIsWeb) {
      log("web ---->>>>>");
      return Future.value(UserInfoModel());
    } else {
      return Future.value(null);
    }
  }
}



class UserInfoModel {
  String? gender;
  String? avatar;
  num? id;
  String? nickName;
  dynamic registerTime;
  String? mobile;
  String? email;
  dynamic token;
  String? inviteCode;
  UserInfoModel(
      {this.id = 0,
        this.avatar,
        this.gender = "M",
        this.nickName = "R",
        this.registerTime = '',
        this.mobile,
        this.email,
        this.token,
        this.inviteCode,
      });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['email'] = email;
    data['token'] = token;
    data['nickName'] = nickName;
    data['invite_code'] = inviteCode;
    return data;
  }
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    log("map -- >>> $json", name: 'models/User');

    UserInfoModel model = UserInfoModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
      nickName: json['nickName'],
      avatar: json['avatar'],
      gender: json['gender'],
      mobile: json['mobile'],
      inviteCode: json['invite_code'],
    );
    return model;
  }
}
