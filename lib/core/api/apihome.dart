


import 'package:dartz/dartz.dart';
import 'package:ecommerce2/core/error/failure.dart';
import 'package:ecommerce2/feature/auth/data/model/modelsinup.dart';

abstract class Apihome {
 Future<Either<Failrue,dynamic>>get(String path, {Object? data, Map<String, dynamic>? parmetrs,Map<String, dynamic>? headers});
   Future<Either<Failrue,dynamic>> post(String path, {Object? data, Map<String, dynamic>? parmetrs});
 Future<dynamic> pot(String path, {Object? data, Map<String, dynamic>? parmetrs});
 Future<dynamic> delete(String path, {Object? data, Map<String, dynamic>? parmetrs});
}
