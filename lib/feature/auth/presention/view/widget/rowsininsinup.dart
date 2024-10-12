import 'package:ecommerce2/constants.dart';
import 'package:flutter/material.dart';

class Rowsininsinup extends StatelessWidget {
  const Rowsininsinup({super.key, required this.onTap, required this.text, required this.button});
final void Function() onTap;
final String text;
final String button;
  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Text(text,style: TextStyle(fontSize: 20),),
    InkWell(
      onTap:onTap ,
      child: Text(button,style: TextStyle(fontSize: 20,color: color),)),
      ],
    );
  }
}