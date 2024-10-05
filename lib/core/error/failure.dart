import 'package:dio/dio.dart';

abstract class Failrue {
  final String errormassage;

  Failrue(this.errormassage);
}

class ServerFailure extends Failrue {
  ServerFailure(super.errormassage);
  factory ServerFailure.fromDioError(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
         case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioerror.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

    
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    if (response != null && response.data is Map<dynamic, String>) {
      dynamic? server = response.data['message'];
      if (server != null) {
        return server;
      }
    }
    if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (response.statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (response.statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
