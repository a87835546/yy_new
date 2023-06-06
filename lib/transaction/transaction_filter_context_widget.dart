import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customer/customer_top_widget.dart';
import '../utils/app_singleton.dart';

class FilterContextWidget extends StatefulWidget {
  const FilterContextWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FilterContextWidgetState();
  }

}

class _FilterContextWidgetState extends State<FilterContextWidget> {
  List<String> list = ['1','2'];
  List<String> sales = ['Delivery','Walk In','Other'];
  List<bool> salesFlag = [false,false,false];
  List<String> Expenses = ['Flue','Salary','Other'];
  List<bool> ExpensesFlag = [false,false,false];
  List<String> others = ['Receivable','Payable'];
  List<bool> othersFlag = [false,false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.only(left: 15,right: 15),
      height: 355 + MediaQuery.of(context).viewPadding.bottom,
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              children: [
                IconButton(onPressed: (){
                }, icon: const Icon(Icons.filter_alt,size: 25,),),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text('Filter Transactions',style: TextStyle(fontSize: 16),),
                ),
                Expanded(child: Container(),flex: 1,),
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close,size: 25,),),
              ],
            ),
          ),

          Container(
            child: Column(
              children: [
                Container(child: Text('Handled by'),height: 30,alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: 15,right: 15),),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Container(height: 40,child: DropdownButtonFormField(
                  isExpanded: false,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(), labelText: ''),
                  // 设置默认值
                  value: list[0],
                  // 选择回调
                  onChanged: (String? newPosition) {
                    setState(() {
                      // select /= newPosition??select;
                    });
                    log('new $newPosition');
                  },
                  // 传入可选的数组
                  items: list.map((String sex) {
                    return DropdownMenuItem(value: sex, child: Text(sex));
                  }).toList(),
                ),),),
              ],
            )
          ),

          MultiCheckBoxWidget(title: 'Sales',titles: sales,flags: salesFlag,click: (val){
            setState(() {
              salesFlag = val;
            });
          },),
          MultiCheckBoxWidget(title: 'Expenses',titles: Expenses,flags: ExpensesFlag,click: (val){
            setState(() {
              ExpensesFlag = val;
            });
          },),
          MultiCheckBoxWidget(title: 'By account',titles: others,flags: othersFlag,click: (val){
              setState(() {
                othersFlag = val;
              });
          },),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child: GestureDetector(onTap: (){
                setState(() {
                  salesFlag = [false,false,false];
                  ExpensesFlag = [false,false,false];
                  othersFlag = [false,false];
                });
              },child: Container(alignment: Alignment.center,child: const Text('Clear',style: TextStyle(fontSize: 16),),)),),
              Expanded(flex: 1,child: GestureDetector(onTap: (){
                Navigator.of(context).pop();
              },child: Container(alignment: Alignment.center,child: const Text('Apply',style: TextStyle(fontSize: 16),),)),),
            ],
          )
        ],
      ),
    );
  }
}

class SelectItem extends StatefulWidget {
  final bool selected;
  final String title;
  final Function click;
  const SelectItem({super.key,required this.selected,required this.title,required this.click});

  @override
  State<StatefulWidget> createState() {
    return _SelectItemState();
  }

}

class _SelectItemState extends State<SelectItem>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              widget.click();
            },
            child: widget.selected? Icon(Icons.check_box,size: 25,):Icon(Icons.check_box_outline_blank,size: 25,),
          ),
          Text(widget.title,style: TextStyle(color: Colors.black12,fontSize: 14),)
        ],
      ),
    );
  }
}

class MultiCheckBoxWidget extends StatefulWidget {
  final String title;
  final List<String> titles;
  List<bool> flags;
  Function(List<bool>)  click;
  MultiCheckBoxWidget({super.key,required this.titles,required this.flags,required this.title,required this.click});


  @override
  State<StatefulWidget> createState() {
   return _MultiCheckBoxWidgetState();
  }

}

class _MultiCheckBoxWidgetState extends State<MultiCheckBoxWidget>{
  @override
  Widget build(BuildContext context) {

    return  Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
        child: Column(
          children: [
            Container(alignment: Alignment.centerLeft,child: Text(widget.title),height: 20,),
            const SizedBox(height: 5,),
            Row(
              children: widget.titles.map((String sale) {
                int i = widget.titles.indexOf(sale);
                return Expanded(flex: 1,child: SelectItem(selected: widget.flags[i],title: sale,click: (){
                  setState(() {
                    widget.flags[i] = !widget.flags[i];
                  });
                  widget.click(widget.flags);
                },),);
              }).toList(),
            )
          ],
        )
    );
  }

}