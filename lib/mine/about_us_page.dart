import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/mine/account_item.dart';
import 'package:yy_new/utils/app_singleton.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

import '../utils/color.dart';
import 'mine_list_item.dart';

class AboutUsPage extends BaseStatefulWidget {
  const AboutUsPage({super.key});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() => _AboutUsPageState();
}
class _AboutUsPageState extends BaseStatefulState<AboutUsPage> {
  String _version = "123";
  @override
  void initState() {
    super.initState();
     getVersion();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          NaviTop(),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              "About Us",
              style: TextStyle(color: color_d4d4d4(),fontWeight: FontWeight.w800,fontSize: 16),
            ),
          ),
          Container(height: 200,child: Row(
            children: [
              Container(child: Image.asset("name"),),
              Container(padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text('$_version',style: TextStyle(color: Colors.black,fontSize: 16,),),
                  Text('your version is up to date',style: TextStyle(color: Colors.black,fontSize: 12),)
                ],
              ),)
            ],
          ),),
          MineListItem(
              icon: "",
              title: "Like us on Facebook",
              subTitle: AppSingleton.userInfoModel?.email ?? ""),
          MineListItem(
            icon: "",
            title: 'Join us on Telegram',
            subTitle: AppSingleton.userInfoModel?.nickName ?? "",
          ),
          MineListItem(
              icon: "",
              title: "Join us on WhatsApp",
              subTitle: AppSingleton.userInfoModel?.email ?? ""),
          MineListItem(
            icon: "",
            title: 'Contact us',
            subTitle:  "aaa",
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 50, 0, 0),
            alignment: Alignment.center,
            color: Colors.transparent,
            height: 150,
            child: Column(
              children: [
                Text(
                  "Developed by HiveSize",
                  style: TextStyle(color: color_d4d4d4(),fontWeight: FontWeight.w600,fontSize: 14),
                ),
                Text(
                  "hivesize.com",
                  style: TextStyle(color: color_d4d4d4(),fontWeight: FontWeight.w300,fontSize: 12),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version; //版本号
    String buildNumber = packageInfo.buildNumber; //版本构建号
    setState(() {
      _version = version;
    });
  }
}