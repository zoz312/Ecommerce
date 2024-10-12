import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/feature/home/data/model/modelGetDasta.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/core/cache/cache_helper.dart';

import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());
  final Apihome api;
  Future getProducts() async {
    emit(HomeLoading());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = await preferences.getString(ApiKey.token);
    final rsponse = await api
        .get(Endpoint.products, headers: {ApiKey.authorization: token,
        'lang':'en'});
    rsponse.fold((failure) {
      emit(Homefailure(error: failure.toString()));
    }, (rsponse) {
      List<modelgetdata> data2 = [];
      for (var element in rsponse['data']['data']) {
        data2.add(modelgetdata.fromJson(element));
      }
      emit(HomeLoaded(data: data2));
    });
  }

  
}
/**
 * 
 *     
    dynamic data = rsponse;
    List<modelgetdata> dataa = data['data']['data'];
    List<modelgetdata> data2 = [];
    for (var element in dataa) {
      data2.add(modelgetdata.fromJson());
    }
 */