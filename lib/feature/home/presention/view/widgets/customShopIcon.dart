import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CutomShopicon extends StatelessWidget {
  const CutomShopicon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            border: Border.all(color: Colors.white)),
        child: Center(
            child: IconButton(
          icon: Icon(Icons.shopping_bag_outlined, size: 22,color: Colors.white,),
          onPressed: () {
          //  GoRouter.of(context).pop();
          },
        )),
      ),
    );
  }
}
