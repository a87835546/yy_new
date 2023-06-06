import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yy_new/base_class/base_page.dart';
import 'package:yy_new/widgets/navi_top_widget.dart';

import '../utils/color.dart';
import '../widgets/input_widget.dart';
import '../widgets/store_management_button.dart';

class StaffManagementPage extends BaseStatefulWidget {
  final double height;
  const StaffManagementPage({super.key,required this.height});

  @override
  BaseStatefulState<BaseStatefulWidget> getState() {
    return _StaffManagementPageState();
  }


}
class _StaffManagementPageState extends BaseStatefulState<StaffManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(context: context,removeTop: true, child: Column(
        children: [
           NaviTop(height: widget.height,),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 20,bottom: 0),
            alignment: Alignment.centerLeft,
            child: Row(children:
            [ const Text('My Staff',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
              Expanded(flex: 1,child: Container(),),
              GestureDetector(child:
              Container(width: 100,alignment: Alignment.center,child: const Text('+ Add',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),),onTap: (){

              },)],),),
          const Padding(padding: EdgeInsets.only(left: 20,right: 20),child: InputWidget(placeholder: 'Search',showPlaceholder: false,),),

          const SizedBox(height: 40,),
          Expanded(flex: 1,child: ListView.builder(itemBuilder: (context,index){
            return Container(padding: const EdgeInsets.only(left: 15,right: 15),child: const StaffItemWidget(),);
          },itemCount: 15,shrinkWrap: true,),)
        ],
      ),),
    );
  }

}


class StaffItemWidget extends StatefulWidget {
  const StaffItemWidget({super.key});

  @override
  State<StatefulWidget> createState() {
   return _StaffItemWidgetState();
  }

}

class _StaffItemWidgetState extends State<StaffItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 1),
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          image: DecorationImage(image: AssetImage("imgs/onboarding-bg.png"),fit: BoxFit.fill )
        ),
        padding: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Text(
              "123",
              style: TextStyle(
                  color: color_707070(),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),alignment: Alignment.centerLeft,height: 44,),
            Container(child: Text(
              "123",
              style: TextStyle(
                  color: color_707070(),
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),alignment: Alignment.centerLeft,height: 44,),
          ],
        ),
      ),
      SizedBox(height: 10,)
    ],);
  }
}