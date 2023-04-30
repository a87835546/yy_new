import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class MineListItem extends StatefulWidget {
  final String title;
  final String? icon;
  final String? subTitle;
  final Widget? right;
  final Function? click;

  const MineListItem(
      {Key? key, required this.title,this.click, this.subTitle, this.right,  this.icon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MineListItemState();
}

class _MineListItemState extends State<MineListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      if(widget.click!=null){
        widget.click!();
      }
    },child: Container(
      color: Colors.transparent,
      height: 60,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [

          Expanded(
            flex: 1,
            child: Row(
              children: [
                const Icon(Icons.ac_unit,weight: 30,color: Colors.red,),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: color_707070(),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: widget.right ??
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          widget.subTitle??"",
                          style: TextStyle(
                              color: color_d4d4d4(),
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                ),
                Visibility(visible: true,child:  Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: color_d4d4d4(),
                ),),
              ],
            ),
          ),
          Divider(
            color: color_d4d4d4(),
            height: 1,
          )
        ],
      ),
    ),);
  }
}
