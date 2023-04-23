import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/widgets/navi_back_item.dart';

import '../utils/app_singleton.dart';
import '../widgets/navi_top_widget.dart';
import 'mine_list_item.dart';

class ChangeEmail extends BaseStatefulWidget{
  final String email;
  const ChangeEmail({super.key,required this.email});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() => _ChangeEmailState();

}

class _ChangeEmailState extends BaseStatefulState<ChangeEmail> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          NaviTop(),

        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}