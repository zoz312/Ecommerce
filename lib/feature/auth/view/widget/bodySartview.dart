import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/widgets/CustomButton.dart';
import 'package:ecommerce2/feature/auth/view/widget/containerStratView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bodystartview extends StatelessWidget {
  const Bodystartview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        containerStartview(),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomButton(
            text: 'Login',
            onPressd: () {
              GoRouter.of(context).push('/l');
            },
            color: color2,
            colorb: Colors.white,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomButton(
            text: 'SinUp',
            onPressd: () {
               GoRouter.of(context).push('/s');
            },
            color: color,
            colorb: Colors.white,
          ),
        )
      ],
    );
  }
}
