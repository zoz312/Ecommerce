import 'package:dio/dio.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/feature/home/presention/manger/Detcubit/detailes_cubit.dart';
import 'package:ecommerce2/feature/home/presention/manger/cubit/favor_cubit.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/BodyDetailesproduct.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/customShopIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detailesproducts extends StatelessWidget {
  const Detailesproducts({super.key, required this.id});
  final String id;
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) =>
          DetailesCubit(Apiimplement(dio: Dio()))..getProducts(id: id)),
          BlocProvider(
      create: (context) =>
          FavorCubit(Apiimplement(dio: Dio()))
          
          ),
    
    
      ],
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
        
        body: Bodydetailesproduct(),
      )),
    );
  }
}
