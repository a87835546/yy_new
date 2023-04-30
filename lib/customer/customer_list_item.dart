import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerListItem extends StatefulWidget {
  final String? avatar;
  final String title;
  final String mobileNum;
  final String? money;
  final Function click;
  const CustomerListItem({super.key,required this.title,required this.mobileNum,required this.click, this.avatar,this.money});
  @override
  State<StatefulWidget> createState() {
    return _CustomerListItemState();
  }

}
class _CustomerListItemState extends State<CustomerListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){widget.click();},child: Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      alignment: Alignment.center,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 79,
            child: Row(
              children: [
                Container(child: Icon(Icons.person),width: 40,),
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 20, alignment: Alignment.centerLeft,child: Text(widget.title,style: TextStyle(color: Colors.grey)),),
                      Container(height: 20, alignment: Alignment.centerLeft,child: Text(widget.mobileNum,style: TextStyle(color: Colors.grey)),),
                    ],
                  ),),),
                Visibility(visible: true,child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: CupertinoColors.black.withOpacity(0.1)),
                      color: CupertinoColors.black.withOpacity(0.05)
                  ),
                  width: 40,height: 20,child: Text(widget.money??'10'),),)
              ],
            ),
          ),
          const Divider(color: Colors.redAccent,height: 0.6,)
        ],
      ),
    ),);
  }
}