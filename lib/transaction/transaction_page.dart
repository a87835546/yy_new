import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yy_new/transaction/transaction_detail_page.dart';
import 'package:yy_new/transaction/transaction_filter_context_widget.dart';
import 'package:yy_new/transaction/transaction_item.dart';
import 'package:yy_new/transaction/transaction_top_widget.dart';
import 'package:yy_new/transaction/transcation_model.dart';
import 'package:yy_new/utils/navigator_util.dart';

import '../base_class/base_page.dart';
import '../main.dart';
import '../utils/app_singleton.dart';
import '../utils/event_bus_util.dart';
import '../utils/http_manager.dart';
import '../utils/toast.dart';
import 'Transaction_filter_widget.dart';


class TransactionPage extends BaseStatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  BaseStatefulState<BaseStatefulWidget> getState() => _TransactionPageState();
}

class _TransactionPageState extends BaseStatefulState<TransactionPage>
    with AutomaticKeepAliveClientMixin {
  final _controller = ScrollController();
  final RefreshController _refreshController = RefreshController();
  String _rsgBalance = "0";
  num? _rate = 0;
  UserInfoModel? _model;
  StreamSubscription? _streamSubscription;
  String date = '';
  @override
  void initState() {
    super.initState();
    log('transaction page');
    getData();
    // loadBalance();
    _streamSubscription = EventBusUtil.listen((event) {
      log("home page event listen -----------?>>>>>>>>>>> $event");
      if (event is RefreshRpEvent) {
        // getAmount();
      } else if (event is RefreshDashboardEvent) {
        getData();
      }
    });
    DateTime now = DateTime.now();
    date = '${now.year}-${now.month}-${now.day}';
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
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height +
                      MediaQuery.of(context).padding.bottom ,
                  child: Column(
                    children: [
                      Container(
                        height: 15,
                        color: Colors.transparent,
                      ),
                      const TransactionTopWidget(),
                      Container(
                        color: Colors.transparent,
                        child: TransactionFilterWidget(clickDate: (){
                          showModalBottomSheet(context: context, builder: (BuildContext context){
                            return CalendarDatePicker(initialDate: DateTime.now(), firstDate:DateTime(2023),lastDate:DateTime.now(), onDateChanged: (DateTime value) {
                              log('val $value');
                              setState(() {
                                date = '${value.year}-${value.month}-${value.day}';
                              });
                              Navigator.of(context).pop();
                            },);
                          });
                        },clickFilter: (){
                          showModalBottomSheet(context: context, builder: (BuildContext context){
                            return const FilterContextWidget();
                          });
                        },date: date,),
                      ),

                      Expanded(
                        child: SmartRefresher(
                          controller: _refreshController,
                          onRefresh: () async {
                            getData();
                          },
                          child: Container(
                            // padding: const EdgeInsets.only(left: 15, right: 15),
                            child: ListView(
                              controller: _controller,
                              shrinkWrap: true,
                              children: [0,1,2,3,4,5,6,7,8,9].map((int index){
                                return TransactionItem(model: TransactionModel(),click: (){
                                  NavigatorUtil.push(context, TransactionDetailPage());
                                },);
                              } ).toList()
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void getData() async {
    showLoading();
    // Future.wait([loadBalance(), getPoints(), getUser(), getAmount()])
    //     .whenComplete(() {
    //   _refreshController.refreshCompleted();
    //   EasyLoading.dismiss();
    // });
    _refreshController.refreshCompleted();
    EasyLoading.dismiss();
  }

  Future getReferralsCount() async {
    var r = await HttpManager.get(
        url: "user/referralsCount",
        params: {"referralCode":  ""});
    log("referral count --->>>$r");
    if (mounted && r["data"] != null) {
      setState(() {});
    }
  }


  @override
  bool get wantKeepAlive => true;
}
