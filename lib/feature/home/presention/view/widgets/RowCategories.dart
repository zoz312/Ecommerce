import 'package:ecommerce2/constants.dart';
import 'package:flutter/material.dart';


class Rowcategories extends StatelessWidget {
  const Rowcategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( 'Product',style: TextStyle( fontWeight: FontWeight.bold,fontSize:  22),),
        Text( 'See All',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey),),
      ],
    );
  }
}