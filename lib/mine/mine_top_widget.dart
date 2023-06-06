import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yy_new/mine/subscription_page.dart';
import 'package:yy_new/utils/app_singleton.dart';
import 'package:yy_new/utils/navigator_util.dart';

import '../widgets/base_top_widget.dart';
import 'account_page.dart';
import 'account_profile_page.dart';
import 'mine_top_recevier_widget.dart';
import 'mine_top_subscription_widget.dart';

class MineTopWidget extends StatefulWidget{
  const MineTopWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MineTopWidgetState();
  }

}
class _MineTopWidgetState extends State<MineTopWidget>{
  final title = "14 days remaining";
  final title1 = "14 days remaining";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          BaseTopWidget(title: 'MENU',clickOne: (){NavigatorUtil.push(context, AccountProfilePage());},clickTwo: (){NavigatorUtil.push(context, AccountPage());},),
          Container(height: 80,child: MineTopSubscriptionWidget(title: 'John Uncle', subtitle: AppSingleton.userInfoModel?.nickName?? 'Chris Neb',click: (){
            NavigatorUtil.push(context, AccountProfilePage());

          },),),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            height: 100,

            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color:  Colors.black12,),
            child: MineTopSubscriptionWidget(title: 'Subscription', subtitle: title,right: GestureDetector(
              onTap: (){
                log('click extend or buy');
                NavigatorUtil.push(context, const SubscriptionPage());
              },
              child: Container(
                width: 80,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all(color: Colors.black12),borderRadius: const BorderRadius.all(Radius.circular(2))),
                child: const Text('Extend/Buy'),
              ),
            ),),
          ),
          const MineTopRecevierWidget()
        ],
      ),
    );
  }

}
