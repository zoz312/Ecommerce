import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/core/widgets/CustomButton.dart';
import 'package:ecommerce2/feature/auth/presention/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/home/presention/manger/Detcubit/detailes_cubit.dart';
import 'package:ecommerce2/feature/home/presention/manger/cubit/favor_cubit.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/rowfav.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/rowpricecart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bodydetailesproduct extends StatelessWidget {
  const Bodydetailesproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailesCubit, DetailesState>(
      builder: (context, state) {
        if (state is Detailesloeded) {
          print(state.data.inFavorites);
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CachedNetworkImage(
                    width: 250,
                    height: 300,
                    fit: BoxFit.fill,
                    imageUrl: state.data.image.toString(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 56,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18))),
                  child: Column(
                    children: [
                      Text(
                        state.data.name.toString(),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        state.data.description.toString(),
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 193, 190, 190)),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      rowfav(
                        id: state.data.id.toString(),
                        fav: state.data.inFavorites,
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      rowpricecart(
                        price: state.data.price!.toDouble(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is Detailesfilure) {
          return Text('data');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

