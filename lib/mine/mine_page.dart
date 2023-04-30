import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../base_class/base_page.dart';
import '../utils/app_singleton.dart';
import '../utils/clip_borad_tool.dart';
import '../utils/color.dart';
import 'account-verification.dart';
import 'mine_list.dart';
import 'mine_top_widget.dart';

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
          physics: NeverScrollableScrollPhysics(),
          children: [
            const MineTopWidget(),
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
