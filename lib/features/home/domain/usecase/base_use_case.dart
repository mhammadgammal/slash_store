import 'package:slash_store/features/home/domain/entity/product_model.dart';

abstract class BaseUseCase {
  Future<ProductModel> perform();
}
