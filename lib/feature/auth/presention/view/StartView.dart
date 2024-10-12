import 'package:ecommerce2/feature/auth/presention/view/widget/bodySartview.dart';
import 'package:flutter/material.dart';

class Startview extends StatelessWidget {
  const Startview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Bodystartview(),
      ),
    );
  }
}