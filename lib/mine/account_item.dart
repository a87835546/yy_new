import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class AccountItem extends StatefulWidget{
  final String title;
  final String? subTitle;
  final Function click;

  const AccountItem({super.key, required this.title,this.subTitle,required this.click});

  @override
  State<StatefulWidget> createState() {
    return _AccountItemState();
  }

}
class _AccountItemState extends State<AccountItem> {
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
                  Icon(Icons.keyboard_arrow_right,size: 30,color: Colors.grey,weight: 1,)
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