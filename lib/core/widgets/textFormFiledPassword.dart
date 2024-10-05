import 'package:flutter/material.dart';

class TextformFiledPassword extends StatefulWidget {
  const TextformFiledPassword({
    
    super.key,
    required this.text,
   
    required this.validator,
    this.controller
  });
  final String? Function(String?) validator;
  final String text;
  
final TextEditingController? controller;
  @override
  State<TextformFiledPassword> createState() => _TextformFiledPasswordState();
}

class _TextformFiledPasswordState extends State<TextformFiledPassword> {    bool v = true;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.controller,
      obscuringCharacter: "*",
      obscureText: v,
    
      validator: widget.validator,
      decoration: InputDecoration(
          filled: true,
          enabled: true,
          fillColor: Color.fromARGB(255, 214, 214, 213),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                //color: kcolors,
                width: 0,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                //color: kcolors,
                width: 0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                // color: kcolors,
                width: 0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red,
                width: 0,
              )),
       prefixIcon   : Icon(Icons.remove_red_eye_outlined),
        suffixIcon  : IconButton(
            onPressed: () {
            setState(() {  if (v == true) {
                v = false;
              } else {
                v = true;
              }
              
                
              });
            },
            icon: Icon(Icons.remove_red_eye_outlined),
          ),
          labelText: widget.text),
    );
  }
}
