import 'package:flutter/material.dart';

class textFormFiledemail extends StatelessWidget {
  const textFormFiledemail({
    super.key,
     this.controller,
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
        // RegEx pattern for validating email
        String pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null; // Return null if the email is valid
      },
      decoration: InputDecoration(
          filled: true,
          enabled: true,
          fillColor: Color.fromARGB(255, 214, 214, 213),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                //  color: kcolors,
                width: 0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                //  color: kcolors,
                width: 0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                //   color: kcolors,
                width: 0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              )),
          //  suffixIcon: Icon(Icons.remove_red_eye),
          prefixIcon: Icon(Icons.email),
          labelText: 'email'),
    );
  }
}
/**
 *  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  // RegEx pattern for validating email
                  String pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null; // Return null if the email is valid
                },
 * 
 */