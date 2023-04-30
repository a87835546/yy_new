import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

class AccountProfilePage extends BaseStatefulWidget {
  const AccountProfilePage({super.key});

  @override
  BaseStatefulState<BaseStatefulWidget> getState()=>_AccountProfilePageState();


}
class _AccountProfilePageState extends BaseStatefulState<AccountProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NaviTop()
        ],
      ),
    );
  }

}