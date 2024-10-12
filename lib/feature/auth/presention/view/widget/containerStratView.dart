import 'package:ecommerce2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class containerStartview extends StatefulWidget {
  const containerStartview({
    super.key,
  });

  @override
  State<containerStartview> createState() => _containerStartviewState();
}

class _containerStartviewState extends State<containerStartview>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
        color: color,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .57,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Lottie.asset('assets/json/Animation - 1727792847036 (1).json',
              width: 200, height: 200),
          SizedBox(
            height: 20,
          ),
          Text(
            'Satrt You Shoping journey Now',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text('loaren ipsum dolor sit amet',
              style: TextStyle(fontSize: 18, color: Colors.white))
        ],
      ),
    );
  }
}
