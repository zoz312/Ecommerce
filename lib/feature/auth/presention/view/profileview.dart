import 'package:dio/dio.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/feature/auth/presention/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/presention/view/widget/bodyprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: color2,
        body: Bodyprofile(),
     
    );
  }
}
