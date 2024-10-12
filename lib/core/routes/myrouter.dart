import 'package:ecommerce2/core/cache/cache_helper.dart';
import 'package:ecommerce2/feature/Splash/presention/view/SplsashScreen.dart';
import 'package:ecommerce2/feature/auth/presention/view/Sinupview.dart';
import 'package:ecommerce2/feature/auth/presention/view/StartView.dart';
import 'package:ecommerce2/feature/auth/presention/view/loginview.dart';
import 'package:ecommerce2/feature/auth/presention/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/presention/view/profileview.dart';
import 'package:ecommerce2/feature/home/presention/view/DetailesProducts.dart';
import 'package:ecommerce2/feature/home/presention/view/HomePageview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class Approte {
  static var router = GoRouter(routes: <RouteBase>[
    GoRoute(path: '/',
    builder: (context, state) { return Splsashscreen();},
    ),
    GoRoute(
      path: '/sp',
      builder: (context, state) {
        //   return Startview();
        return FutureBuilder<bool>(
            future: BlocProvider.of<UserCubit>(context).chickishivetoken(),
            builder: (context, SnapshotWidget) {
              if (SnapshotWidget.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (SnapshotWidget.hasError) {
                return Text('data',);
              } else {
                bool value =  SnapshotWidget.data??false;
                print(value);
                return value ? Homepageview() : Startview();
              }
            });
      },
    ),
    GoRoute(
        path: '/l',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Loginview(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: '/s',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Sinupview(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        }),

         GoRoute(
          
        path: '/d',
      
        pageBuilder: (context, state) {
          
          return CustomTransitionPage(
            
            key: state.pageKey,
            child: Detailesproducts(id:state.extra as String  ,),
            
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        }),
  ]);
}

