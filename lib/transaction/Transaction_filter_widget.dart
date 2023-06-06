import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionFilterWidget extends StatefulWidget{
  final Function clickDate;
  final Function clickFilter;
  final String? date;
  const TransactionFilterWidget({super.key,required this.clickDate,required this.clickFilter,this.date});

  @override
  State<StatefulWidget> createState() {
   return _TransactionFilterWidgetState();
  }

}

class _TransactionFilterWidgetState extends State<TransactionFilterWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15,right: 15),
      color: Colors.grey.withOpacity(0.4),
      child: Row(
        children: [
          IconButton(onPressed: (){
            widget.clickDate();
          }, icon: const Icon(Icons.date_range,size: 25,),),
          Container(
           height: 40,
            alignment: Alignment.center,
           child: Text(widget.date??'${DateTime.now().month}'),
          ),
          Expanded(child: Container(),flex: 1,),
          IconButton(onPressed: (){
            widget.clickFilter();
          }, icon: const Icon(Icons.filter_alt,size: 25,),),
        ],
      ),
    );
  }

}