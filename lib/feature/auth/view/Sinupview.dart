import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/feature/auth/view/widget/bodySinup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sinupview extends StatelessWidget {
  const Sinupview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body:Bodysinup() 
    );
  }
}