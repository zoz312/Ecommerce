import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce2/feature/home/data/model/modelGetDasta.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Gridviewfav extends StatelessWidget {
  const Gridviewfav({super.key, required this.data});
  final List<modelgetdatafav> data;
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
            GoRouter.of(context)
                .push('/d', extra: data[index].product!.id.toString());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  CachedNetworkImage(
                    width: 120,
                    height: 130,
                    fit: BoxFit.fill,
                    imageUrl: data[index].product!.image.toString(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].product!.name.toString(),
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
                        '\$${data[index].product!.price.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        itemCount: data.length,
      ),
    );
    ;
  }
}
