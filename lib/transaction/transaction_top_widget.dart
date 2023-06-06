import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customer/customer_top_widget.dart';
import '../utils/app_singleton.dart';

class TransactionTopWidget extends StatefulWidget {
  const TransactionTopWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TransactionTopWidgetState();
  }

}

class _TransactionTopWidgetState extends State<TransactionTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: AppSingleton.height??0),
            width: MediaQuery.of(context).size.width,
            height: (AppSingleton.height??0)+44,
            child: const Text('Transactions',style: TextStyle(color: Colors.black12,fontSize: 16),),
          ),
          Container(
            child: Row(
              children: [
                CustomerTitleLabel(title: '10000',desc: 'New Profit',width: 100,),
                Expanded(child: Container(),flex: 1,),
                CustomerTitleLabel(title: '254',desc: 'Sales',width: 100,),
                CustomerTitleLabel(title: '254',desc: 'Expense',width: 100,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

