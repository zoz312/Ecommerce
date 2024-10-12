import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/feature/auth/presention/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/presention/view/widget/bodyLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: color2,
        body: Form(
          key:BlocProvider.of<UserCubit>(context).key ,
          child: Bodylogin()),
      ),
    );
  }
}