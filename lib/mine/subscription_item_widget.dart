import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionItemWidget extends StatefulWidget {
  final int index;
  final double? height;
  final Function(int)? click;
  final bool? show;
  const SubscriptionItemWidget({super.key,required  this.index,this.height,this.click,this.show});

  @override
  State<StatefulWidget> createState() {
    return _SubscriptionItemWidgetState();
  }

}

class _SubscriptionItemWidgetState extends State<SubscriptionItemWidget>{
  List<int> list = [1,6,12];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(3),
          ),
          // height: 80,
          child: Row(
            children: [
              Expanded(flex: 2,child:  Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30,child: const Text('Current Subscription',style: TextStyle(fontSize: 16,color: Colors.black87),),),
                    Container(child: Text('Enjoy unlimited access to all features for ${list[widget.index]} month',style: TextStyle(fontSize: 12,color: Colors.black87),),),
                  ],
                ),
              ),),
              Expanded(flex: 1,child:  Column(
                children: [
                  Container(height: 30,child: const Text('599',style: TextStyle(fontSize: 16,color: Colors.black87),),),
                  Visibility(child: GestureDetector(
                    onTap: (){
                      if (widget.click != null){
                        widget.click!(widget.index);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black12)),child:
                    const Text('Purchase',style: TextStyle(fontSize: 16,color: Colors.black87),),),
                  ),visible: widget.show??true,)
                ],
              ),),
            ],
          ),
        ),
        SizedBox(height: widget.height??10,)
      ],
    );
  }

}