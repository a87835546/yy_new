import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineTopSubscriptionWidget extends StatefulWidget{
  final String title;
  final String subtitle;
  final Widget? left;
  final Widget? right;
  final Function? click;
  const MineTopSubscriptionWidget({super.key,required this.title,required this.subtitle,this.left,this.right,this.click});

  @override
  State<StatefulWidget> createState() {
    return _MineTopSubscriptionWidgetState();
  }

}
class _MineTopSubscriptionWidgetState extends State<MineTopSubscriptionWidget>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.click != null){
          widget.click!();
        }
      },
      child: Container(
        child: Row(
          children: [
            Container(child:widget.left?? Icon(Icons.person,size: 30,),),
            Expanded(child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),),
                  const SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.subtitle,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),),
                ],),)),
            Container(
              child: widget.right??Icon(Icons.arrow_forward_ios_outlined,size: 30,),
            )
          ],
        ),
      ),);
  }

}