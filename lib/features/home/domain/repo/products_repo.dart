import 'package:slash_store/features/home/domain/entity/product_model.dart';

abstract class ProductsRepository{
  Future<ProductModel> getBestSelling();
  Future<ProductModel> getNewArrivals();
  Future<ProductModel> getRecommendedForYou();
}