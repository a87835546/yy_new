import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/mine/sub_info_item_widget.dart';
import 'package:yy_new/utils/color.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

class SubscriptionInfoPage extends BaseStatefulWidget {
  final int index;
  final double height;
  const SubscriptionInfoPage({super.key,required this.index,required this.height});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() {
    return _SubscriptionInfoPageState();
  }

}

class _SubscriptionInfoPageState extends BaseStatefulState<SubscriptionInfoPage>{
  int i = 1;
  int price = 500;
  @override
  void initState() {
    super.initState();
    log('height--->>> ${widget.height}');
  }
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      // removeBottom: true,
      removeTop: true,
        context: context,
        child:  Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              NaviTop(height: widget.height,),
              const SizedBox(height: 15,),
              Container(height:40,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const Text('Subscription',
                  style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w600),),),
              Container(alignment: Alignment.centerLeft,padding: const EdgeInsets.only(left: 15), child:
              const Text('Review and confirm your order',
                style: TextStyle(fontSize: 16,color: Colors.black38,fontWeight: FontWeight.w300),)),

              Container(
                // height: 50,
                padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Column(
                      children: [
                        Container( child: Text('Basic Plan'),alignment: Alignment.centerLeft,height: 20,),
                        Container(child: Text('1 month'),alignment: Alignment.centerLeft,height: 20,),
                      ],),flex: 1,),
                    Expanded(flex: 1,child: Container(alignment: Alignment.centerRight, child: Text('$price')),)
                  ],
                ),
              ),
              Container(
                // height: 50,
                padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container( alignment: Alignment.centerLeft,height: 20, child: const Text('Quantity'),),
                        Container(child: Text('1 month'),alignment: Alignment.centerLeft,height: 20,),
                      ],),
                    Expanded(flex: 1,child: Container(),),
                    Row(
                      children: [
                        TextButton(onPressed: (){
                          setState(() {
                            i ==0 ? i = 0 : i --;
                          });
                        }, child: const Text('-')),
                        Text('$i'),
                        TextButton(onPressed: (){
                          setState(() {
                            i++;
                          });
                        }, child: const Text('+')),
                      ],
                    ),
                  ],
                ),
              ),
              Container(child:
             ListView(
               shrinkWrap: true,

               children: [
                 const Divider(height: 1,color: Colors.black,),
                 const SizedBox(height: 20,),
                 Container(
                   child: Text('Select a payment method'),alignment: Alignment.centerLeft,height: 20,),
                 SubInfoItemWidget(),
                 SubInfoItemWidget(),
                 SubInfoItemWidget(),
                 SubInfoItemWidget(),
                 SubInfoItemWidget(),
                 const Divider(height: 1,color: Colors.black,),
               ],
             ),
             height: MediaQuery.of(context).size.height - 310,)

            ],
          ),
          Positioned(
            left: 0,bottom: 10,height: 80,width: MediaQuery.of(context).size.width ,
            child:
              Column(
                children: [
                  const Divider(height: 1,color: Colors.black,),
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                    color: Colors.white,
                    child:Row(
                      children: [
                        Container(width: 50,height: 30,alignment: Alignment.center,child: const Text('Total'),),
                        Expanded(flex: 1,child: Container(),),
                        Column(
                          children: [
                            Text('\$${i*price}',style: const TextStyle(color: Colors.black87,fontSize: 18,),),
                            const Text('GCash'),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        GestureDetector(onTap: (){
                          log('click check out');
                        },child: Container(
                          height: 30,
                          decoration: BoxDecoration(border: Border.all(color: color_707070()),borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.all(5),
                          child: Text('Check Out',style: TextStyle(color:color_BFBFBF(),fontSize: 12 ),),
                        ),)
                      ],
                    ),),
                ],
              ),)
        ],
      ),
    ));
  }

}