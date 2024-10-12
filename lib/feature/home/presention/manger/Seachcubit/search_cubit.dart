import 'package:bloc/bloc.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/feature/home/data/model/modelGetDasta.dart';
import 'package:ecommerce2/feature/home/presention/manger/Homecubit/home_cubit.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.api) : super(SearchInitial());

  final Apihome api;
  Future SearchProducts({String? text}) async {
    emit(Searchloading());

    final rsponse = await api.post(Endpoint.productssearch,
        headers: {'lang': 'en'}, data: {"text": text});
    rsponse.fold((failure) {
      emit(Searchfailure(error: failure.toString()));
    }, (rsponse) {
      if (rsponse['data'] == null ||
          rsponse['data']['data'] == null ||
          rsponse['data']['data'].isEmpty) {
        emit(Searchfailure(error: 'no data search'));
      } else {
        List<modelgetdata> data2 = [];
        for (var element in rsponse['data']['data']) {
          data2.add(modelgetdata.fromJson(element));
        }
        print('object');

        emit(searchloaded(data: data2));
      }
    });
  }
}
