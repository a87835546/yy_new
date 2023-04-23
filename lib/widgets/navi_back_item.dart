import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yy_new/utils/navigator_util.dart';

class NaviBackButton extends StatefulWidget{
  const NaviBackButton({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NaviBackButtonState();
  }

}
class _NaviBackButtonState extends State<NaviBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigatorUtil.pop(context);
      },
      child: Container(
        height: 44,
        width: 50,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(child: Icon(Icons.arrow_back_ios_outlined,size: 20,),),
            Container(child: Text("back")),
          ],
        ),
      ),

    );
  }

}