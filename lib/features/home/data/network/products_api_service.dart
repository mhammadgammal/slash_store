import 'package:dio/dio.dart';
import 'package:slash_store/core/network/api_endpoints.dart';
import 'package:slash_store/core/network/dio_client.dart';

abstract class ProductsApiService{
  static Future<Response> getBestSelling() => DioClient.get(ApiEndpoints.bestSelling);
  static Future<Response> getNewArrivals() => DioClient.get(ApiEndpoints.newArrival);
  static Future<Response> getRecommendedForYou() => DioClient.get(ApiEndpoints.recommendedForYou);
}