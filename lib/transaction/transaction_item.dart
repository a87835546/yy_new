import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yy_new/transaction/transcation_model.dart';

class TransactionItem extends StatefulWidget {
  final TransactionModel model;
  final Function click;
  const TransactionItem({super.key,required this.model,required this.click});

  @override
  State<StatefulWidget> createState() {
    return _TransactionItemState();
  }

}

class _TransactionItemState extends State<TransactionItem>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        widget.click();
      },
      child: Container(
        height: 80,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                children: [
                  Expanded(flex: 1,child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(alignment: Alignment.centerLeft,height: 40,child: Text('${widget.model.type??1}'),),
                      Container(alignment: Alignment.centerLeft,height: 39,child: Text('${widget.model.delivery??'zhansan'}'),),
                    ],
                  ),),
                  Expanded(flex: 1,child: Container(child: Text('${widget.model.amount??100}'),alignment: Alignment.centerRight,),)
                ],
              ),
            ),
            Divider(color: Colors.redAccent,height: 1,)
          ],
        ),
      ),

    );
  }
}