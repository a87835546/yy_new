import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:yy_new/customer/customer_page.dart';
import 'package:yy_new/transaction/transaction_page.dart';
import 'package:yy_new/utils/app_singleton.dart';
import 'package:yy_new/utils/color.dart';
import 'package:yy_new/utils/event_bus_util.dart';


import 'base_class/base_page.dart';
import 'home/home_page.dart';
import 'mine/account_page.dart';
import 'mine/mine_page.dart';

class CustomBottomNavigationBar extends BaseStatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  BaseStatefulState<BaseStatefulWidget> getState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState
    extends BaseStatefulState<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  StreamSubscription? _streamSubscription;
  int _index = 2;
  List<IndexedStackChild> pages = [
    IndexedStackChild(
      child: const MinePage(),
    ),
    IndexedStackChild(
      child: const CustomerPage(),
    ),
    IndexedStackChild(
      child: const HomePage(),
    ),
    IndexedStackChild(
      child: const TransactionPage(),
    ),
    IndexedStackChild(child: const AccountPage()),
  ];

  @override
  void initState() {
    super.initState();
    _streamSubscription = EventBusUtil.listen((event) {
      log("init page event listen -----------?>>>>>>>>>>> $event");
      if (event is TabBarChangeEvent) {
        setState(() {
          _index = event.index;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.resume();
  }

  @override
  Widget build(BuildContext context) {
    // AppSingleton.state = this;
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ProsteIndexedStack(
            index: _index,
            children: pages,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
                log("tab bar click index ---->>>$value");
              });
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.store_rounded),
                label: 'MarketPlace',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_2), label: 'CUSTOMERS'),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: '+',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes_rounded), label: 'TRANSACTIONS'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'SETTINGS'),
            ],
            selectedItemColor: mainColor(),
            unselectedItemColor: mainTitleColor(),
            selectedFontSize: 13,
            unselectedFontSize: 11,
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
