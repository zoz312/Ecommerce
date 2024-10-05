import 'package:ecommerce2/feature/auth/view/mamger/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Bodyhomeview extends StatelessWidget {
  const Bodyhomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is Userloaded) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.massage)));
              GoRouter.of(context).push('/l');
        }
      },
      builder: (context, state) {
        return Center(
            child: FilledButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).Sinout();
                },
                child: Text('data')));
      },
    );
  }
}
