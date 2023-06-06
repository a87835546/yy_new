import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yy_new/transaction/transaction_filter_context_widget.dart';
import 'package:yy_new/transaction/transaction_item.dart';
import 'package:yy_new/transaction/transaction_top_widget.dart';
import 'package:yy_new/transaction/transcation_model.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

import '../base_class/base_page.dart';
import '../main.dart';
import '../utils/app_singleton.dart';
import '../utils/event_bus_util.dart';
import '../utils/http_manager.dart';
import '../utils/toast.dart';
import 'Transaction_filter_widget.dart';


class TransactionDetailPage extends BaseStatefulWidget {
  const TransactionDetailPage({Key? key}) : super(key: key);

  @override
  BaseStatefulState<BaseStatefulWidget> getState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends BaseStatefulState<TransactionDetailPage>
    with AutomaticKeepAliveClientMixin {
  final _controller = ScrollController();
  StreamSubscription? _streamSubscription;
  @override
  void initState() {
    super.initState();
    log('transaction page');
    // getData();
    // loadBalance();
    _streamSubscription = EventBusUtil.listen((event) {
      log("home page event listen -----------?>>>>>>>>>>> $event");
      if (event is RefreshRpEvent) {
        // getAmount();
      } else if (event is RefreshDashboardEvent) {

      }
    });
    DateTime now = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }

  Widget _widget() {
    return Scaffold(
      body:Column(
        children: [
          const NaviTop(backTitle: 'Transactions',),
          Stack(
            children: [
              Container(
                // margin: EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    Container(

                      child: Text('1000',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      alignment: Alignment.centerRight,
                      height: 60,
                      padding: EdgeInsets.only(right: 15),
                    ),
                    DetailTypeWidget(),
                    Divider(height: 1,),
                    DetailPaymentWidget(),
                    Divider(height: 1,),
                    DetailCustomerWidget(),
                    Divider(height: 1,),
                    DetailOtherWidget()
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }



  @override
  bool get wantKeepAlive => true;
}

class DetailTypeWidget extends StatefulWidget {
  const DetailTypeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailTypeWidgetState();
  }

}

class _DetailTypeWidgetState extends State<DetailTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          SizedBox(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child:Container(alignment: Alignment.centerLeft,child: Text('Type',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),flex: 1,),
              Expanded(child:Container(alignment: Alignment.centerRight,child: Text('Expense',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),flex: 1,),
            ],
          ),),
          SizedBox(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: Text('Category',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('Expense',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          SizedBox(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: Text('Date',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('${DateTime.now()}',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          SizedBox(height: 40,child: Row(
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Referent ID',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Container(alignment: Alignment.centerRight,child: const Text('Expense',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13))),
                          GestureDetector(child: const Icon(Icons.copy_outlined,size: 15,),onTap: (){},),
              ],),),
            ],
          ),),
        ],
      ),
    );
  }
}

class DetailPaymentWidget extends StatefulWidget {
  const DetailPaymentWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailPaymentWidgetState();
  }

}

class _DetailPaymentWidgetState extends State<DetailPaymentWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: const Text('Total',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: const Text('100',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: const Text('Payment',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('0',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('Receivable',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('100',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
        ],
      ),
    );
  }
}

class DetailCustomerWidget extends StatefulWidget {
  const DetailCustomerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailCustomerWidgetState();
  }

}

class _DetailCustomerWidgetState extends State<DetailCustomerWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          Container(child: Text('Slim'),alignment: Alignment.centerLeft,),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Total',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: const Text('100',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          Container(child: Text('Round'),alignment: Alignment.centerLeft,),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Payment',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('0',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
        ],
      ),
    );
  }

}

class DetailOtherWidget extends StatefulWidget {
  const DetailOtherWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailOtherWidgetState();
  }

}
class _DetailOtherWidgetState extends State<DetailOtherWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Customer',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: const Text('100',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Delivery Rider',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('0',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Retrieved',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('0',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
          Container(height: 40,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child:Container(alignment: Alignment.centerLeft,child: const Text('Remakes',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
              Expanded(flex: 1,child:Container(alignment: Alignment.centerRight,child: Text('0',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13)),),),
            ],
          ),),
        ],
      ),
    );
  }
}