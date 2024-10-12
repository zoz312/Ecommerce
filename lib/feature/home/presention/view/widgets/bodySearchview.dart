import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/core/widgets/TextfiledSearch.dart';
import 'package:ecommerce2/feature/home/presention/manger/Homecubit/home_cubit.dart';
import 'package:ecommerce2/feature/home/presention/manger/Seachcubit/search_cubit.dart';
//import 'package:ecommerce2/feature/home/presention/manger/cubit2/search_cubit.dart';
import 'package:ecommerce2/feature/home/presention/view/widgets/GridViewinHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bodysearchview extends StatelessWidget {
  Bodysearchview({super.key});
  String? search;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
      if (state is Searchfailure) {
                     Center(
                       child: Center(
                        child: Text(
                          state.error,
                          style: TextStyle(fontSize: 32, color: Colors.black),
                        ),
                                           ),
                     );
                  } 
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Textfiledsearch(
                onSubmitted: (p0) {
                  context.read<SearchCubit>().SearchProducts(text: p0);
                },
              ),
                SizedBox(
                height: 20,
              ),
              Divider(),
               SizedBox(
                height: 10,
              ),
             if(state is searchloaded)
                  GridViewInHome(model: state.data)
                     ,if(state is Searchloading) 
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                 
                
               
            ],
          ),
        );
      },
    );
  }
}
