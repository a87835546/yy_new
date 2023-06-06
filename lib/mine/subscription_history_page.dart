import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/mine/subscription_info_page.dart';
import 'package:yy_new/mine/subscription_item_widget.dart';
import 'package:yy_new/utils/app_singleton.dart';
import 'package:yy_new/utils/navigator_util.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

class SubscriptionHistoryPage extends BaseStatefulWidget{
  const SubscriptionHistoryPage({super.key});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() {
    return _SubscriptionHistoryPageState();
  }


}

class _SubscriptionHistoryPageState extends BaseStatefulState<SubscriptionHistoryPage> {
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
            padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
            child:const SizedBox(height: 30,child: Text('Purchase History',style: TextStyle(fontSize: 16,color: Colors.black87),),),

          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: ListView.builder(itemBuilder: (context, index) {
             
              return  SubscriptionItemWidget(
                index: index,
                height: 30,
                show:false,
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