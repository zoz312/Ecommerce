import 'package:flutter/material.dart';

class Listtitleuser extends StatelessWidget {
  const Listtitleuser({super.key, required this.text, required this.icon});
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text,style: TextStyle(color: Colors.white,fontSize: 18),),
      leading:  icon,
    );
  }
}
