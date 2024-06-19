import 'package:slash_store/features/home/domain/entity/product_model.dart';

abstract class ProductsRepository{
  Future<List<ProductModel>> getBestSelling();
  Future<List<ProductModel>> getNewArrivals();
  Future<List<ProductModel>> getRecommendedForYou();
}