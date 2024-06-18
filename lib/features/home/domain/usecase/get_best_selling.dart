import 'package:slash_store/features/home/data/repository/products_repo_impl.dart';
import 'package:slash_store/features/home/domain/entity/product_model.dart';
import 'package:slash_store/features/home/domain/usecase/base_use_case.dart';

class GetBestSelling extends BaseUseCase{
  ProductsRepositoryImpl productsRepo = ProductsRepositoryImpl();

  @override
  Future<ProductModel> perform() async{
    return await productsRepo.getBestSelling();
  }

}