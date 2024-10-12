import 'package:ecommerce2/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Splsashscreen extends StatefulWidget {
  const Splsashscreen({super.key});

  @override
  State<Splsashscreen> createState() => _SplsashscreenState();
}

class _SplsashscreenState extends State<Splsashscreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        GoRouter.of(context).go('/sp');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/json/Animation - 1727792847036 (1).json',
              width: 200,
              height: 200,
            ),
          ),
          Text(
            'PrimePick',
            style: TextStyle(fontSize: 24,color:Colors.white ),
          ),
        ],
      ),
    );
  }
}
