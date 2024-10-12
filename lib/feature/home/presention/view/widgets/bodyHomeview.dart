import 'package:dio/dio.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/feature/auth/presention/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/contineroffer.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/GridViewinHome.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/RowCategories.dart';

import 'package:ecommerce2/feature/home/presention/manger/Homecubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Bodyhomeview extends StatelessWidget {
  const Bodyhomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: 10),
          Contineroffer(),
          SizedBox(height: 25),
          Rowcategories(),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is Homefailure) {
                return Center(
                  child: Text(
                    state.error,
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                );
              } else if (state is HomeLoaded) {
                return GridViewInHome(
                 
                  model: state.data,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
