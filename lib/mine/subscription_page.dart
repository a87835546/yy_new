import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/mine/subscription_info_page.dart';
import 'package:yy_new/mine/subscription_item_widget.dart';
import 'package:yy_new/utils/navigator_util.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

class SubscriptionPage extends BaseStatefulWidget{
  const SubscriptionPage({super.key});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() {
    return _SubscriptionPageState();
  }


}

class _SubscriptionPageState extends BaseStatefulState<SubscriptionPage> {
  double height = 0;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    log('height--->>> ${MediaQuery.of(context).padding.top}');

    height = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          NaviTop(),
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,top: 20),
            child: Row(
              children: [
                Container(child: Image.asset("imgs/default_avatar.png",width: 30,height: 30,),width: 60,height: 60,),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30,child: const Text('Current Subscription',style: TextStyle(fontSize: 16,color: Colors.black87),),),
                    Container(child: const Text('Expires on 05/24/2023 12:30 PM'),),
                  ],
                ),
              Expanded(flex: 1,
                child:Container(
                  alignment: Alignment.center,
                  child: Text("12 days left",style: TextStyle(color: Colors.redAccent),),)
              ,)
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const Divider(height: 1,color: Colors.grey,),
          const SizedBox(height: 15,),
          Container(height:40,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 15),
            child: const Text('Subscription Plans',
              style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w600),),),
          Container(alignment: Alignment.centerLeft,padding: const EdgeInsets.only(left: 15), child:
          const Text('All subscription plans include access to all available platforms',
            style: TextStyle(fontSize: 16,color: Colors.black38,fontWeight: FontWeight.w300),)),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: ListView.builder(itemBuilder: (context, index) {
             
              return  SubscriptionItemWidget(
                index: index,
                height: 30,
                click: (i){
                  NavigatorUtil.push(context, SubscriptionInfoPage(index: i,height: height,));
                },
                // model: model.voucher!,
                // isClaimed: true,
              );
            },
              itemCount: 3,
              shrinkWrap: true,),
          )
        ],
      ),
    );
  }

}