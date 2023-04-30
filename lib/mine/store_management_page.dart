import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

import '../widgets/store_management_button.dart';

class StoreManagementPage extends BaseStatefulWidget {
  const StoreManagementPage({super.key});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() {
    return _StoreManagementPageState();
  }


}
class _StoreManagementPageState extends BaseStatefulState<StoreManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NaviTop(),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 20,bottom: 0),
            alignment: Alignment.centerLeft,
            child: const Text('Store Management',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),),
          const SizedBox(height: 40,),
          StoreManagementButton(title: 'Suppliers',desc: 'Add your suppliers and service providers to track all store expenses',click: (){},),
          StoreManagementButton(title: 'Products & Pricing',desc: 'Manage all store products and set its default price to ease calculations',click: (){},),
          StoreManagementButton(title: 'Staff Management',desc: 'View all your staff list and information. Manage and monitor compensations',click: (){},),
        ],
      ),
    );
  }

}