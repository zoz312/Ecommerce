
import 'package:flutter/material.dart';

class textFormFiledname extends StatelessWidget {
  const textFormFiledname({
    super.key, this.controller,
  });
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
      validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
               
              },
     decoration: InputDecoration(
       filled: true,
       enabled: true,
       fillColor: Color.fromARGB(255, 214, 214, 213),
    enabledBorder:  OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
         borderSide: BorderSide(
         //  color: kcolors,
           width: 0,
         ),),
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
         borderSide: BorderSide(
         //  color: kcolors,
           width: 0,
         )
       ),
     focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
         borderSide: BorderSide(
        //   color: kcolors,
           width: 0,
         )
       ),errorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
         borderSide: BorderSide(
           color: Colors.red,
           width: 1,
         )
       ),
     //  suffixIcon: Icon(Icons.remove_red_eye),
       prefixIcon:  Icon(Icons.person),
       labelText: 'Name'
     ),
    
    );
  }
}
/**
 *  
 * 
 */