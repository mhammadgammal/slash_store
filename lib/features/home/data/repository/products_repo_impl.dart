import 'package:slash_store/features/home/data/network/products_api_service.dart';
import 'package:slash_store/features/home/domain/entity/product_model.dart';

import '../../domain/repo/products_repo.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<ProductModel>> getBestSelling() async {
    var bestSellingResponse = await ProductsApiService.getBestSelling();
    var bestSellingData = bestSellingResponse.data;
    print('bestSelling Response: $bestSellingData');
    List<ProductModel> bestSelling = [];
    for (int i = 0; i < bestSellingData.length; i++) {
      bestSelling.add(ProductModel.fromJson(bestSellingData[i]));
    }
    return bestSelling;
  }

  @override
  Future<List<ProductModel>> getNewArrivals() async {
    var newArrivalsResponse = await ProductsApiService.getBestSelling();
    var newArrivalsData = newArrivalsResponse.data;
    print('bestSelling Response: $newArrivalsData');
    List<ProductModel> newArrivals = [];
    for (int i = 0; i < newArrivalsData.length; i++) {
      newArrivals.add(ProductModel.fromJson(newArrivalsData[i]));
    }
    return newArrivals;
  }

  @override
  Future<List<ProductModel>> getRecommendedForYou() async {
    var recommendedForYouResponse = await ProductsApiService.getBestSelling();
    var recommendedForYouData = recommendedForYouResponse.data;
    print('bestSelling Response: $recommendedForYouData');
    List<ProductModel> recommendedForYou = [];

    for (int i = 0; i < recommendedForYouData.length; i++) {
      recommendedForYou.add(ProductModel.fromJson(recommendedForYouData[i]));
    }
    return recommendedForYou;
  }
}
