import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../base_class/base_page.dart';
import '../utils/app_singleton.dart';
import '../utils/clip_borad_tool.dart';
import '../utils/color.dart';
import 'account-verification.dart';
import 'mine_list.dart';

class MinePage extends BaseStatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  BaseStatefulState<BaseStatefulWidget> getState() => _MinePageState();
}

class _MinePageState extends BaseStatefulState<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    log("url ----->>>>${AppSingleton.userInfoModel?.avatar != null}");
    return Scaffold(
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withAlpha(80),
                        blurRadius: 5.0,
                        offset: const Offset(0, 4),
                        spreadRadius: 0)
                  ]),
              child: Column(
                children: [
                  Container(
                    height: 30,
                  ),
                  AppSingleton.userInfoModel?.avatar != "" &&
                          AppSingleton.userInfoModel?.avatar != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.redAccent,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withAlpha(80),
                                    blurRadius: 5.0,
                                    offset: const Offset(0, 4),
                                    spreadRadius: 0)
                              ]),
                              padding: const EdgeInsets.all(4),
                              child: FadeInImage.assetNetwork(
                                placeholder: "imgs/placeholder_avatar.png",
                                image: AppSingleton.userInfoModel?.avatar ?? "",
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              )),
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withAlpha(80),
                                    blurRadius: 2.0,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0)
                              ]),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(45),
                            child: SizedBox(
                              width: 90,
                              height: 90,
                              child: Image.asset(
                                "imgs/placeholder_avatar.png",
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                  Container(
                    child: Text(
                      AppSingleton.userInfoModel?.nickName ?? "123",
                      style: TextStyle(
                          color: color_707070(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "ID:${AppSingleton.userInfoModel?.id}",
                            style: TextStyle(
                                color: color_d4d4d4(),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            child: Icon(
                              Icons.copy,
                              color: color_d4d4d4(),
                              size: 16,
                            ),
                          ),
                          onTap: () {
                            ClipboardTool.setDataToast(
                                "${AppSingleton.userInfoModel?.id}");
                          },
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: MineVerificationWidget(),
                  ),
                ],
              ),
            ),
            const MineList(),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // SignRequest.logout(context);
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 45, right: 45),
                height: 50,
                decoration: BoxDecoration(
                    color: color_707070(),
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
