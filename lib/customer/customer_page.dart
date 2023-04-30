import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yy_new/customer/add_customer_page.dart';
import 'package:yy_new/sign_up_in/sign_up_input_widget.dart';

import '../base_class/base_page.dart';
import '../main.dart';
import '../mine/account_page.dart';
import '../mine/account_profile_page.dart';
import '../mine/mine_top_widget.dart';
import '../utils/app_singleton.dart';
import '../utils/event_bus_util.dart';
import '../utils/http_manager.dart';
import '../utils/navigator_util.dart';
import '../utils/toast.dart';
import '../widgets/base_top_widget.dart';
import 'customer_list_item.dart';
import 'customer_top_widget.dart';


class CustomerPage extends BaseStatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  BaseStatefulState<BaseStatefulWidget> getState() => _CustomerPageState();
}

class _CustomerPageState extends BaseStatefulState<CustomerPage>
    with AutomaticKeepAliveClientMixin {
  final _controller = ScrollController();
  final RefreshController _refreshController = RefreshController();
  String _rsgBalance = "0";
  num? _rate = 0;
  UserInfoModel? _model;
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
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
            child: Container(
              height: MediaQuery.of(context).size.height +
                  MediaQuery.of(context).padding.bottom,

              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 15,top: MediaQuery.of(context).padding.top),
                    color: Colors.transparent,
                    child:BaseTopWidget(title: 'CUSTOMERS',
                      one:Container(child: Icon(Icons.favorite_border,size: 30,),),
                      two:Container(child: Icon(Icons.add,size: 30,),),
                      clickOne: (){NavigatorUtil.push(context, AccountProfilePage());},
                      clickTwo: (){NavigatorUtil.push(context, AddCustomerPage());},),

                  ),
                  const Padding(padding: EdgeInsets.only(left: 15,right: 15),child: CustomerTopWidget(),),
                  SignUpInputWidget(placeholder: 'placeholder', topLabel: 'topLabel',inputValue: (val){
                    log("输入的内容 $val");
                  },),
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
                          children: [
                            const SizedBox(
                              height: 15,
                            ),

                            Container(
                              padding:
                              const EdgeInsets.only(left: 6 + 15, top: 30),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "ARTICLES",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xffD4D4D4),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                            CustomerListItem(title: 'Chris Neb',mobileNum: '+63 09773674300',click: (){},),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
