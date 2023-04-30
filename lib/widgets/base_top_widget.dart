import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BaseTopWidget extends StatefulWidget {
  final String title;
  // final List<Widget> widgets;
  final Widget? one;
  final Widget? two;
  final Function? clickOne;
  final Function? clickTwo;
  const BaseTopWidget({super.key,required this.title, this.one, this.two, this.clickOne,this.clickTwo});

  @override
  State<StatefulWidget> createState() {
   return _BaseTopWidgetState();
  }

}

class _BaseTopWidgetState extends State<BaseTopWidget>{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: Row(
        children: [
          Container(
            width:100,
            child: const Text("MENU",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 14),),
          ),
          Expanded(flex: 1,child: Container(),),
          GestureDetector(
            onTap: (){
              // NavigatorUtil.push(context, AccountProfilePage());
              if(widget.clickOne !=null){
                widget.clickOne!();
              }
            },
            child: Container(
              width: 30,
              child: widget.one?? Icon(Icons.notifications_rounded,color: Colors.redAccent,),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              if(widget.clickTwo !=null){
                widget.clickTwo!();
              }
            },
            child: Container(
              width: 30,
              child: widget.two?? Icon(Icons.settings),
            ),
          )
        ],
      ),
    );
  }

}