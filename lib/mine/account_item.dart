import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class AccountItem extends StatefulWidget{
  final String title;
  final String? subTitle;
  final Function click;
  final bool? hasSwitch;
  final bool? display;

  const AccountItem({super.key, required this.title,this.subTitle,this.hasSwitch,this.display,required this.click});

  @override
  State<StatefulWidget> createState() {
    return _AccountItemState();
  }

}
class _AccountItemState extends State<AccountItem> {
  bool flag = false;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.click();
      },
      child: Container(
        color: Colors.white10,
        height: 60,
        padding: const EdgeInsets.only(left: 10, right: 15),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: color_707070(),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.subTitle??"",
                        style: TextStyle(
                            color: color_d4d4d4(),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                 Visibility(visible: true,child:  widget.hasSwitch == true ? CupertinoSwitch(value: flag, onChanged: (val){
                   setState(() {
                     flag = !flag;
                   });
                 }) :
                 Icon(
                   Icons.arrow_forward_ios,
                   size: 16,
                   color: color_d4d4d4(),
                 ))
                ],
              ),
            ),
            Divider(
              color: color_d4d4d4(),
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}