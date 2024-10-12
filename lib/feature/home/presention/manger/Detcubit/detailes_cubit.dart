import 'package:bloc/bloc.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';
import 'package:ecommerce2/feature/home/data/model/modelGetDasta.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'detailes_state.dart';

class DetailesCubit extends Cubit<DetailesState> {
  DetailesCubit(this.api) : super(DetailesInitial());

  final Apihome api;
  Future getProducts({required String id}) async {
      final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = await preferences.getString(ApiKey.token);
    emit(Detailesloeding());

    final rsponse =
        await api.get("${Endpoint.products+'/'+id}", headers: {'lang': 'en',
        ApiKey.authorization:token
        });
    rsponse.fold((failure) {
      emit(Detailesfilure(error: failure.toString()));
    }, (rsponse) {
      dynamic data2 = modelgetdata.fromJson(rsponse['data']);

      emit(Detailesloeded(data: data2));
    });
  }
Future addfavor({required  id}) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = await preferences.getString(ApiKey.token);
    emit(Detailesloeding());
    final response = await api.post(Endpoint.favorites,
    data: {
      ApiKey.product_id:id
    },
    headers: {
      ApiKey.authorization:token
    },
    
    );
     response.fold((failure) {
        emit(favfilure(error: failure.errormassage.toString()));
      }, (response) {
      Modelsinup  fav = Modelsinup.fromJson(response);
        if (fav.status == true) {
         
          emit(FavorLoadedd());
        } else {
          emit(favfilure(error: fav.message.toString()));
        }
      });
    }
  
}

