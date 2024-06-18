import 'package:slash_store/features/home/data/network/products_api_service.dart';
import 'package:slash_store/features/home/domain/entity/product_model.dart';

import '../../domain/repo/products_repo.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<ProductModel> getBestSelling() async{
    var bestSellingResponse = await ProductsApiService.getBestSelling();
    print('bestSelling Response: ${bestSellingResponse.data}');
    return ProductModel.fromJson(bestSellingResponse.data);
  }

  @override
  Future<ProductModel> getNewArrivals() async{
    var newArrivalsResponse = await ProductsApiService.getBestSelling();
    print('bestSelling Response: ${newArrivalsResponse.data}');
    return ProductModel.fromJson(newArrivalsResponse.data);
  }

  @override
  Future<ProductModel> getRecommendedForYou() async{
    var recommendedForYouResponse = await ProductsApiService.getBestSelling();
    print('bestSelling Response: ${recommendedForYouResponse.data}');
    return ProductModel.fromJson(recommendedForYouResponse.data);
  }

}
