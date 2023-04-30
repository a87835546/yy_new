import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/badge_button.dart';

class MineTopRecevierWidget extends StatefulWidget{
  const MineTopRecevierWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MineTopRecevierWidgetState();
  }

}
class _MineTopRecevierWidgetState extends State<MineTopRecevierWidget>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1,child: BadgeButton(title: 'Receivables', badge: '19', click: (){
            log('click Receivables');
          },),),
          const SizedBox(width: 20,),
          Expanded(flex: 1,child: BadgeButton(title: 'Payables', badge: '19', click: (){
            log('click Payables');
          },),)
        ],
      ),
    );
  }

}