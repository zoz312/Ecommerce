import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce2/core/api/apiIntersaptors.dart';
import 'package:ecommerce2/core/api/apihome.dart';
import 'package:ecommerce2/core/api/endpoint.dart';
import 'package:ecommerce2/core/error/exptionerror.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';

class Apiimplement extends Apihome {
  final Dio dio;

  Apiimplement({required this.dio}) {
    dio.options.baseUrl = Endpoint.baseurl;
    dio.interceptors.add(Apiintersaptors());
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true));
  }
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? parmetrs}) async {
    try {
      Response response =
          await dio.delete(path, data: data, queryParameters: parmetrs);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<Either<Failrue, dynamic>> get(String path,
      {Object? data, Map<String, dynamic>? parmetrs, dynamic headers}) async {
    try {
      Response response = await dio.get(path,
          data: data,
          queryParameters: parmetrs,
          options: Options(
            headers: headers,
          ));
    
      return right( response.data );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failrue, dynamic>> post(String path,
      {Object? data, Map<String, dynamic>? parmetrs}) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: parmetrs);
      return right(response.data);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future pot(String path,
      {Object? data, Map<String, dynamic>? parmetrs}) async {
    try {
      Response response =
          await dio.delete(path, data: data, queryParameters: parmetrs);
      //return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
