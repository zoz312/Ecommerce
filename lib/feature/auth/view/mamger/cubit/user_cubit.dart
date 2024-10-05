import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/apiimplement.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/core/cache/cache_helper.dart';

import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';
import 'package:ecommerce2/feature/auth/view/StartView.dart';
import 'package:ecommerce2/feature/auth/view/loginview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final Apihome api;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller2 = TextEditingController();
  TextEditingController passwordcontroller2 = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  GlobalKey<FormState> key2 = GlobalKey();
  Modelsinup? sininn;
  Modelsinup? siniup;
  final key = GlobalKey<FormState>();
  Future sinin() async {
    if (key.currentState!.validate()) {
      emit(Userloading());

      final repo = await api.post(Endpoint.login, data: {
        ApiKey.email: emailcontroller.text,
        ApiKey.password: passwordcontroller.text
      });
      repo.fold((fil) {
        emit(Userfailure(error: fil.errormassage.toString()));
      }, (repo) async {
        sininn = Modelsinup.fromJson(repo);
        if (sininn!.data != null) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString(
              ApiKey.token, sininn!.data!.token.toString());

          // key.currentState!.reset();
          emit(Userloaded(massage: sininn!.message.toString()));
        } else {
          emit(Userfailure(error: sininn!.message.toString()));
        }
      });
    }
  }

  Future sinup() async {
    if (key2.currentState!.validate()) {
      emit(Userloading());
      final response = await api.post(Endpoint.register, data: {
        ApiKey.name: namecontroller.text,
        ApiKey.phone: phonecontroller.text,
        ApiKey.email: emailcontroller2.text,
        ApiKey.password: passwordcontroller2.text,
      });
      response.fold((failure) {
        emit(Userfailure(error: failure.errormassage.toString()));
      }, (response) {
        siniup = Modelsinup.fromJson(response);
        if (siniup!.status == true) {
          CacheHelper().saveData(key: 'token', value: siniup!.data!.token);
          CacheHelper().saveData(key: 'id', value: siniup!.data!.id);
          emit(Userloaded(massage: siniup!.message.toString()));
        } else {
          emit(Userfailure(error: siniup!.message.toString()));
        }
      });
    }
  }

  Future getprofile() async {
    emit(Userloading());
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = await preferences.getString(ApiKey.token);
    final repo =
        await api.get(Endpoint.profile, headers: {ApiKey.authorization: token});
    repo.fold((failure) {
      emit(Userfailure(error: failure.errormassage.toString()));
    }, (response) {
      siniup = Modelsinup.fromJson(response);
      if (siniup!.status == true) {
        emit(getloaded(modelsinup: siniup!));
      } else {
        emit(Userfailure(error: siniup!.message.toString()));
      }
    });
  }

  Future<bool> chickishivetoken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(ApiKey.token);
  }

  Future<void> Sinout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(ApiKey.token);
    emit(Userloaded(massage: 'done'));
  }
}
