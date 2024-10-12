import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class rowpricecart extends StatelessWidget {
  const rowpricecart({
    super.key, required this.price,
  });
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' \$ ${price}',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        Container(
            width: 250,
            height: 50,
            child: CustomButton(
                text: 'Add cart',
                onPressd: () {},
                color: color,
                colorb: Colors.white))
      ],
    );
  }
}
