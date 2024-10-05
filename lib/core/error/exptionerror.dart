
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/error/errormodel.dart';


class ServerException implements Exception {
  final String errModel;

  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel:'Connection timeout with ApiServer');
    case DioExceptionType.sendTimeout:
      throw ServerException(errModel: 'Send timeout with ApiServer');
    case DioExceptionType.receiveTimeout:
      throw ServerException(errModel:'Receive timeout with ApiServer');
    case DioExceptionType.badCertificate:
      throw ServerException(errModel: 'Send timeout with ApiServer');
    case DioExceptionType.cancel:
      throw ServerException(errModel: 'Send timeout with ApiServer');
    case DioExceptionType.connectionError:
      throw ServerException(errModel:'Send timeout with ApiServer');
    case DioExceptionType.unknown:
      throw ServerException(errModel: 'Send timeout with ApiServer');
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
              errModel:'Send timeout with ApiServer');
        case 401: //unauthorized
          throw ServerException(
              errModel: 'Send timeout with ApiServer');
        case 403: //forbidden
          throw ServerException(
              errModel:'Send timeout with ApiServer');
        case 404: //not found
          throw ServerException(
              errModel: 'Send timeout with ApiServer');
        case 409: //cofficient
          throw ServerException(
              errModel: 'Send timeout with ApiServer');
        case 422: //  Unprocessable Entity
          throw ServerException(
              errModel: 'Send timeout with ApiServer');
        case 504: // Server exception
          throw ServerException(
              errModel:'Send timeout with ApiServer');
      }
  }
}