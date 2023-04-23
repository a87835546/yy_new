import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yy_new/widgets/navi_back_item.dart';

class NaviTop extends StatefulWidget {
  final String? title;
  final Widget? right;
  const NaviTop({super.key, this.title,this.right});

  @override
  State<StatefulWidget> createState() {
    return _NaviTopState();
  }
}

class _NaviTopState extends State<NaviTop>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewPadding.top + 44,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NaviBackButton(),
          Expanded(flex: 1,child: Container(height: 44,color: Colors.transparent,alignment: Alignment.center,child: Text(widget.title??"",style: TextStyle(color: Colors.black),),)),
          widget.right?? const SizedBox(width: 50,)
        ],
      ),
    );
  }
}