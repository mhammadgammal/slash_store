import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash_store/features/home/domain/entity/product_model.dart';
import 'package:slash_store/features/home/domain/usecase/get_best_selling.dart';
import 'package:slash_store/features/home/domain/usecase/get_new_arrivals.dart';
import 'package:slash_store/features/home/domain/usecase/get_recommended.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var getBestSellingUseCase = GetBestSelling();
  var getNewArrivalsUseCase = GetNewArrivals();
  var getRecommendedUseCase = GetRecommendedForYou();

  List<ProductModel> bestSelling = [], newArrivals = [], recommendedForYou = [];
  Future<void> fetchData() async{
    bestSelling = await getBestSellingUseCase.perform();
    emit(BestSellingDataFetchedState());

    newArrivals = await getBestSellingUseCase.perform();
    emit(NewArrivalsDataFetchedState());

    recommendedForYou = await getRecommendedUseCase.perform();
    emit(RecommendedForYouDataFetchedState());
  }
}
