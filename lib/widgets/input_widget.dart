import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String placeholder;

  const InputWidget({super.key,this.controller,required this.placeholder});

  @override
  State<StatefulWidget> createState() {
    return _InputWidgetState();
  }

}
class _InputWidgetState extends State<InputWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TextField(
        cursorColor: const Color(0xffC1C2C4),
        controller: widget.controller,
        obscureText: false,
        style: const TextStyle(
          color: Colors.black45,
          fontSize: 12,
        ),
        decoration: InputDecoration(

            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: Color(0xff707070)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.greenAccent, width: 1),
              borderRadius: BorderRadius.circular(3),
            ),
            // border: InputBorder.none,
            hintText: widget.placeholder,
            hintStyle: const TextStyle(color: Color(0xffC1C2C4)),
            contentPadding: const EdgeInsets.only(left: 20, bottom: 10)),
        onChanged: (value) {
          // setState(() {
          //   _value = value;
          // });
          // if (widget.inputValue != null) {
          //   widget.inputValue!(value);
          // }
        },
        onEditingComplete: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          FocusManager.instance.primaryFocus?.unfocus();
          FocusScope.of(context).requestFocus(FocusScopeNode());
          // if (widget.inputValue != null) {
          //   widget.inputValue!(_value);
          // }
        },
      ),
    );
  }

}