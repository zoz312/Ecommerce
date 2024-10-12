import 'package:flutter/material.dart';

class Textfiledsearch extends StatelessWidget {
  const Textfiledsearch({
    super.key,
    this.controller, this.onSubmitted,
  });
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted:onSubmitted ,
      controller: controller,
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

          //  suffixIcon: Icon(Icons.remove_red_eye),
          suffixIcon:
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          labelText: 'Search'),
    );
  }
}
