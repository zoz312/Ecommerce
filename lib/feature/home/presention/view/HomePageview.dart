import 'package:dio/dio.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/feature/auth/presention/mamger/cubit/user_cubit.dart';
import 'package:ecommerce2/feature/auth/presention/view/profileview.dart';
import 'package:ecommerce2/feature/home/presention/manger/Seachcubit/search_cubit.dart';
import 'package:ecommerce2/feature/home/presention/manger/cubit/favor_cubit.dart';
import 'package:ecommerce2/feature/home/presention/view/FavoratieView.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/bodyHomeview.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/bodySearchview.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/customShopIcon.dart';
import 'package:ecommerce2/feature/home/presention/manger/Homecubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepageview extends StatefulWidget {
  const Homepageview({super.key});

  @override
  State<Homepageview> createState() => _HomepageviewState();
}

class _HomepageviewState extends State<Homepageview> {
  int select = 0;
  List<Widget> body = [
    Bodyhomeview(),
    Bodysearchview(),
    Favoratieview(),
    Profileview(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      
        BlocProvider(
          create: (context) => SearchCubit((Apiimplement(dio: Dio())),
        ),),
        BlocProvider(
      create: (context) => UserCubit(Apiimplement(dio: Dio()))..getprofile(),)
     
  , BlocProvider(
      create: (context) => FavorCubit(Apiimplement(dio: Dio())),),
    

      ],
      child:  Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: select,
            backgroundColor: color2,
            selectedItemColor: color2,
            unselectedItemColor: Colors.white,

            onTap: (v) {
              setState(() {
                select = v;
              });
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: color,
                icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
 BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
        backgroundColor: color2,
        appBar: AppBar(
          backgroundColor: color2,
          title: Text(
            'PrimePick',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          actions: [CutomShopicon()],
        ),
        body: body[select],
      
    ));
  }
}
