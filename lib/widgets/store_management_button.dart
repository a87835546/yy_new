import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreManagementButton extends StatefulWidget{
  final String title;
  final String desc;
  final String? image;
  final Function click;
  const StoreManagementButton({super.key,required this.title,required this.desc,required this.click,this.image});

  @override
  State<StatefulWidget> createState() {
    return _StoreManagementButtonState();
  }

}
class _StoreManagementButtonState extends State<StoreManagementButton>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      widget.click();
    },
      child: Container(
        margin: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: CupertinoColors.black.withOpacity(0.2)),
          color: CupertinoColors.black.withAlpha(10),
        ),
        child:Row(
          children: [
            Container(child: Icon(Icons.construction_outlined,size: 40,),width: 60,height: 60,),
           Expanded(flex: 1,child:  Column(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               Container(alignment: Alignment.centerLeft,child: Text(widget.title,style: TextStyle(fontSize: 16),),),
               const SizedBox(height: 6,),
               Container(alignment: Alignment.centerLeft, child: Text(widget.desc,style: TextStyle(color: CupertinoColors.black),),)
             ],
           ),)
          ],
        ),
      ),);
  }

}