import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/core/cache/cache_helper.dart';
import 'package:ecommerce2/core/routes/myrouter.dart';
import 'package:ecommerce2/feature/auth/view/mamger/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(Apiimplement(dio: Dio())),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        routerConfig: Approte.router,
      ),
    );
  }
}
