import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            "PERSONAL INFORMATION",
            style: TextStyle(color: color_d4d4d4()),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
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
            ),
            MineListItem(
              icon: "",
              subTitle: AppSingleton.userInfoModel?.inviteCode ?? "",
              title: 'Staff Management',
            ),

          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            "SETTINGS",
            style: TextStyle(color: color_d4d4d4()),
          ),
        ),
        MineListItem(
          icon: "",
          title: "Change Password",
          right: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color_d4d4d4(),
              ),
            ),
          ),
        ),
        MineListItem(
          title: "Face ID",
          right: Container(
            alignment: Alignment.centerRight,
            width: double.maxFinite,
            child: Switch(
              value: isShow,
              onChanged: (v) {
                setState(() {
                  isShow = !isShow;
                });
              },
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            "",
            style: TextStyle(color: color_d4d4d4()),
          ),
        ),
        MineListItem(
          icon: "",
          title: "About",
          right: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color_d4d4d4(),
              ),
            ),
          ),
        ),
        MineListItem(
          icon: "",
          title: "Terms & Conditions",
          right: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color_d4d4d4(),
              ),
            ),
          ),
        ),
        MineListItem(
          title: "Privacy Policy",
          right: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color_d4d4d4(),
              ),
            ),
          ),
        ),
        MineListItem(
          title: "Disable Account",
          right: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color_d4d4d4(),
              ),
            ),
          ),
        ),
        MineListItem(
          title: "App Version",
          subTitle: _version,
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
