import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:slash_store/core/theme/app_images.dart';
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

  int activeIndex = 0;

  List<Image> offers= [
    Image.asset(AppImages.blackFridayOffer),
    Image.asset(AppImages.bestDealOffer),
  ];

  //categoreis record
  List<(String, String)> categories = [
    ('Fashion', AppImages.fashionIc),
    ('Games', AppImages.gamesIc),
    ('Accessories', AppImages.accessoriesIc),
    ('Books', AppImages.booksIc),
  ];

  static HomeCubit get(context) => BlocProvider.of(context);
  List<ProductModel> bestSelling = [], newArrivals = [], recommendedForYou = [];
  Future<void> fetchData() async{
    bestSelling = await getBestSellingUseCase.perform();
    emit(BestSellingDataFetchedState());

    newArrivals = await getBestSellingUseCase.perform();
    emit(NewArrivalsDataFetchedState());

    recommendedForYou = await getRecommendedUseCase.perform();
    emit(RecommendedForYouDataFetchedState());
  }

  void changeCurrentIndex(int index) {
    activeIndex = index;
    emit(OfferIndexChangedState());
  }
}
