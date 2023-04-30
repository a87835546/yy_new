import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubInfoItemWidget extends StatefulWidget {
  const SubInfoItemWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SubInfoItemWidgetState();
  }

}
class _SubInfoItemWidgetState extends State<SubInfoItemWidget>{
  bool flag =false;
  @override  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewPadding(context: context,removeTop: true,

      child: Container(
        child: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                flag = !flag;
              });
            },
            child: Container(
              child: Row(
                children: [
                  Container(child: Icon(Icons.account_balance_wallet_outlined,size: 20,),),
                  Container(child: Text('e-Wallets'),),
                  Container(child: flag ==false ? Icon(Icons.arrow_drop_down_sharp,size: 20,):Icon(Icons.arrow_drop_up_sharp,size: 20,),)
                ],
              ),
            ),
          ),
          Visibility(visible: !flag,child: ListView.builder(itemBuilder: (context,index){
            return Container(
              height: 60,
              color: Colors.black12,
              padding: const EdgeInsets.only(left: 20,right: 20,top: 0),
              child: Row(
                children: [
                  SizedBox(width: 40,height: 40,child: Image.asset("imgs/google@2x.png",),),
                  const SizedBox(width: 10,),
                  Expanded(flex: 1,child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: Text('GCash'),),
                      Container(child: Text('25 fee'),),
                    ],
                  ),),
                  Container(child: Icon(Icons.deselect,size: 20,),)
                ],
              ),
            );
          },
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),)
        ],
      ),
    ),);
  }

}