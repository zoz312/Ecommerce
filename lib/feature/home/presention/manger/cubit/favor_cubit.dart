import 'package:bloc/bloc.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';
import 'package:ecommerce2/feature/home/data/model/modelGetDasta.dart';
import 'package:ecommerce2/feature/home/presention/manger/Detcubit/detailes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favor_state.dart';

class FavorCubit extends Cubit<FavorState> {
  FavorCubit(this.api) : super(FavorInitial());

  final Apihome api;
  Color? color;
  Future addfavor({required String id}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = await preferences.getString(ApiKey.token);
    final response = await api.post(
      Endpoint.favorites,
      data: {ApiKey.product_id: id},
      headers: {ApiKey.authorization: token},
    );
    response.fold((failure) {
      emit(Favorfailure(error: failure.errormassage.toString()));
    }, (response) {
      Modelsinup fav = Modelsinup.fromJson(response);
      if (fav.status == true) {
        emit(FavorLoaded());
      } else {
        emit(Favorfailure(error: fav.message.toString()));
      }
    });
  }

  Future getfavProducts({String? text}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = await preferences.getString(ApiKey.token);
    emit(FavorLoading());

    final rsponse = await api.get(
      Endpoint.favorites,
      headers: {'lang': 'en', ApiKey.authorization: token},
    );
    rsponse.fold((failure) {
      emit(Favorfailure(error: failure.toString()));
    }, (response) {
      // تحقق مما إذا كانت البيانات null أو فارغة
      if (response['data'] == null ||
          response['data']['data'] == null ||
          response['data']['data'].isEmpty) {
        emit(Favorfailure(error: 'empty'));
      } else {
        List<modelgetdatafav> data2 = [];
        for (var element in response['data']['data']) {
          data2.add(modelgetdatafav.fromJson(element));
        }
       
        emit(getFavorLoaded(data: data2));
      }
    });
  }
}
