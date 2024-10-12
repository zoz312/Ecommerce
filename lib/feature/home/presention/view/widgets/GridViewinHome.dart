import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/feature/home/data/model/modelGetDasta.dart';
import 'package:ecommerce2/feature/home/presention/manger/Homecubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GridViewInHome extends StatelessWidget {
  const GridViewInHome({super.key, required this.model, this.onTap});
  final List<modelgetdata> model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
       shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 13,
        ),
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            GoRouter.of(context).push('/d', extra: model[index].id.toString());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
           
            color: Colors.white, ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  CachedNetworkImage(
                    width:120 ,
                     height: 130,
                  fit: BoxFit.fill,
                  imageUrl: model[index].image.toString(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model[index].name.toString(),
                    maxLines: 2,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('price:'),
                      Text(
                        '\$${model[index].price.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        itemCount: model.length,
      ),
    );
  }
}
