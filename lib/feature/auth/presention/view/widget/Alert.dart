import 'package:ecommerce2/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



  void showAlertDialog(BuildContext context,String cont, {required void Function() onpressed}) {
    // Create an alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context ) {
        return AlertDialog(
        
          alignment: Alignment.centerRight,
         backgroundColor: color,

         // title: Text("جيد",style: TextStyle(color: Colors.white),),
          content: Text(cont,style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
              style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color2) ,),
              child: Text("OK",style: TextStyle(color: Colors.white),),
              onPressed:onpressed,
            ),
          ],
        );
      },
    );
  }
