import 'package:flutter/cupertino.dart';

class CustomerTopWidget extends StatefulWidget {
  const CustomerTopWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomerTopWidgetState();
  }

}

class _CustomerTopWidgetState extends State<CustomerTopWidget>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomerTitleLabel(title: '254',desc: 'Total',),
        CustomerTitleLabel(title: '254',desc: 'Active',),
        CustomerTitleLabel(title: '254',desc: 'Inactive',),
        Expanded(child: Container(),flex: 1,),
        CustomerTitleLabel(title: '254',desc: 'Receviables',width: 100,),
      ],
    );
  }

}

class CustomerTitleLabel extends StatelessWidget {
  final String title;
  final String desc;
  final double? width;
  const CustomerTitleLabel({super.key,required this.title,required this.desc,this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??60,
      child: Column(
      children: [
        Container(
          child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        ),
        Container(
          child: Text(desc),
        ),
      ],
    ),);
  }

}