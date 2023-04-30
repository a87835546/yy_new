import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yy_new/mine/store_management_page.dart';
import 'package:yy_new/utils/navigator_util.dart';

import '../utils/app_singleton.dart';
import '../utils/color.dart';
import 'mine_list_item.dart';

class MineList extends StatefulWidget {
  const MineList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineListState();
}

class _MineListState extends State<MineList> {
  bool isShow = false;
  String? _version;

  @override
  void initState() {
    super.initState();
    loadVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            "PERSONAL INFORMATION",
            style: TextStyle(color: color_d4d4d4()),
          ),
        ),
        MineListItem(
            icon: "",
            title: "Reports",
            subTitle: AppSingleton.userInfoModel?.email ?? ""),
        MineListItem(
          icon: "",
          title: 'Expenses',
          subTitle: AppSingleton.userInfoModel?.nickName ?? "",
        ),
        MineListItem(
          icon: "",
          subTitle: AppSingleton.userInfoModel?.inviteCode ?? "",
          title: 'Sales',
        ),
        MineListItem(
          icon: "",
          subTitle: AppSingleton.userInfoModel?.inviteCode ?? "",
          title: 'Receivables & Payables',
        ),
        MineListItem(
          icon: "",
          subTitle: AppSingleton.userInfoModel?.inviteCode ?? "",
          title: 'Store Management',
          click: (){
            NavigatorUtil.push(context, const StoreManagementPage());
          },
        ),
        MineListItem(
          icon: "",
          subTitle: AppSingleton.userInfoModel?.inviteCode ?? "",
          title: 'Referral',
        ),
      ],
    );
  }

  void loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version; //版本号
    String buildNumber = packageInfo.buildNumber; //版本构建号
    log("version -->>> $version");
    setState(() {
      _version = version;
    });
  }
}
