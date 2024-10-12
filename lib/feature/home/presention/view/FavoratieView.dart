import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/feature/home/presention/manger/cubit/favor_cubit.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/GridViewinHome.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/Gridviewfav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Favoratieview extends StatelessWidget {
  const Favoratieview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavorCubit(Apiimplement(dio: Dio()))..getfavProducts(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Favorite',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          BlocBuilder<FavorCubit, FavorState>(
            builder: (context, state) {
              if (state is getFavorLoaded) {
                return Gridviewfav(data: state.data);
              } else if (state is Favorfailure) {
                return Center(child: Text(state.error));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
