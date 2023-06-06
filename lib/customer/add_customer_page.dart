import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

import '../widgets/input_widget.dart';

class AddCustomerPage extends BaseStatefulWidget {
  const AddCustomerPage({super.key});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() {
    return _AddCustomerPageState();
  }

}

class _AddCustomerPageState extends BaseStatefulState<AddCustomerPage>{
  String select = '1';

  @override
  Widget build(BuildContext context) {
    List<String> list = ['1','2','3'];
    return Scaffold(
      body: Column(
        children: [
          NaviTop(),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 44,
            child: MediaQuery.removePadding(context: context, removeTop: true,child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0,bottom: 0,top: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text('Add Customers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),
                Container(
                  padding: EdgeInsets.only(left: 20,bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Fill-in all the necessary information',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200),),),
                const SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.only(left: 00,bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Customer Information',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),

                Container(
                  padding: EdgeInsets.only(left: 00,top: 20,bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text('Name *',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: 'Customer Name',),),

                Container(
                  padding: EdgeInsets.only(left: 00,top: 20,bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text('Mobile Number',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: 'Mobile Number',),),

                Container(
                  padding: EdgeInsets.only(left: 00,top: 20,bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text('Type',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Container(height: 40,child: DropdownButtonFormField(
                  isExpanded: true,

                  decoration:  InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Type'),
                  // 设置默认值
                  value: '$select',
                  // 选择回调
                  onChanged: (String? newPosition) {
                    setState(() {
                      select = newPosition??select;
                    });
                    log('new $newPosition');
                  },
                  // 传入可选的数组
                  items: list.map((String sex) {
                    return DropdownMenuItem(value: sex, child: Text(sex));
                  }).toList(),
                ),),),


                Container(
                  padding: EdgeInsets.only(left: 00,bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Delivery Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Container(
                  padding: EdgeInsets.only(left: 0,bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: const Text('Delivery Information',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: '123',),),

              ],
            )),
          )
        ],
      ),
    );
  }

}

