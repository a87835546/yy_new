import 'package:flutter/cupertino.dart';

class BadgeButton extends StatefulWidget{
  final String title;
  final String badge;
  final Function click;
  const BadgeButton({super.key,required this.title,required this.badge,required this.click});

  @override
  State<StatefulWidget> createState() {
   return _BadgeButtonState();
  }

}
class _BadgeButtonState extends State<BadgeButton>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      widget.click();
    },
    child: Container(

      width: 150,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: CupertinoColors.black)
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(child: Text(widget.title,style: TextStyle(fontSize: 16),),),
          SizedBox(width: 20,),
          Container(alignment: Alignment.center,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: CupertinoColors.black),height: 20,width: 20, child: Text(widget.badge,style: TextStyle(color: CupertinoColors.white),),)
        ],
      ),
    ),);
  }

}