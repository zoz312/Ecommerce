import 'package:ecommerce2/feature/home/presention/manger/cubit/favor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class rowfav extends StatefulWidget {
  const rowfav({
    super.key,
    required this.id,
    required this.fav,
  });

  final String id;
  final bool? fav;
  @override
  State<rowfav> createState() => _rowfavState();
}

class _rowfavState extends State<rowfav> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavorCubit, FavorState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white)),
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<FavorCubit>(context)
                          .addfavor(id: widget.id);
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: widget.fav == true ? Colors.red : Colors.white,
                      size: 40,
                    ))),
            Text(
              '⭐⭐⭐⭐⭐',
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}

/**
 * Text(' Price : \$ 2500',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)
 */