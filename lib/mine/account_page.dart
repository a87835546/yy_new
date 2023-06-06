import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yy_new/mine/account_item.dart';
import 'package:yy_new/sign_up_in/sign_modify_password_page.dart';
import 'package:yy_new/utils/navigator_util.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

import '../main.dart';
import '../utils/app_singleton.dart';
import '../utils/color.dart';
import '../utils/constants.dart';
import '../utils/http_manager.dart';
import 'about_us_page.dart';
import 'change_email_page.dart';
import 'mine_list_item.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  double progress = 0;
  UserInfoModel? _model = AppSingleton.userInfoModel;
  String _version = "1.0";

  @override
  void initState() {
    super.initState();
    getUser();
    getVersion();
  }

  @override
  Widget build(BuildContext context) {
    log("user avatar --- >>> ${_model?.nickName}");
    return Scaffold(
        body: Column(
      children: [
        NaviTop(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text(
                    "Settings",
                    style: TextStyle(color: color_d4d4d4(),fontWeight: FontWeight.w800,fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text(
                    "Security",
                    style: TextStyle(color: color_d4d4d4()),
                  ),
                ),
                AccountItem(title: "Biometrics Login",hasSwitch: true,click: (){
                  log("click Biometrics Login");
                },),
                AccountItem(title: "Change Password",subTitle: '',click: (){
                  log("click change password");
                  NavigatorUtil.push(context, const SignModifyPasswordPage());
                },),
                AccountItem(title: "Mobile Number",subTitle: _model?.mobile??'6309773674305',click: (){
                  log("click change password");
                },),
                AccountItem(title: "Change Email",subTitle: _model?.email??'aa@aa.com',click: (){
                  log("click change password");
                  NavigatorUtil.push(context,  ChangeEmail(email: _model?.email??"aa@aa.com",));
                },),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text(
                    "Others",
                    style: TextStyle(color: color_d4d4d4()),
                  ),
                ),
                AccountItem(title: "Privacy",subTitle: '',click: (){
                  log("click Privacy");
                },),
                AccountItem(title: "About Us",subTitle: _version,click: (){
                  log("click change password");

                  NavigatorUtil.push(context,  const AboutUsPage());

                },),
                AccountItem(title: "Delete Account",click: (){
                  log("click change password");
                },),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version; //版本号
    String buildNumber = packageInfo.buildNumber; //版本构建号
    setState(() {
      _version = version;
    });
  }

  Future getUser() async {
    var r = await HttpManager.get(
        url: "user/getInfo", params: {"userId": "${_model?.id}"});
    log("user info res ------>>>>$r");
    if (mounted && r["data"] != null) {
      var temp = r["data"];
      UserInfoModel object = UserInfoModel.fromJson(temp);
      setState(() {
        _model = object;
      });
      AppSingleton.updateInfoModel(object);
    }
  }
}
