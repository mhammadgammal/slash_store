import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:slash_store/core/router/navigator.dart';
import 'package:slash_store/core/router/router_helper.dart';
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

  int activeSliderIndex = 0;
  int currentBottomNavIndex = 0;

  //offers record
  List<Image> offers = [
    Image.asset(AppImages.blackFridayOffer),
    Image.asset(AppImages.bestDealOffer),
  ];

  //categoreis record
  List<(String, String)> categories = [
    ('Fashion', AppImages.fashionIc),
    ('Games', AppImages.gamesIc),
    ('Accessories', AppImages.accessoriesIc),
    ('Books', AppImages.booksIc),
    (
      'Artifacts',
      AppImages.artifactsIc,
    ),
    (
      'Pets Care',
      AppImages.petsCareIc,
    ),
  ];

  List<(String ic, String title, String route)> bottomNavItems = [
    (
      AppImages.homeIc,
      'Home',
      RouterHelper.home,
    ),
    (
      AppImages.heartIc,
      'Favorite',
      RouterHelper.favorites,
    ),
    (
      AppImages.cartIc,
      'Cart',
      RouterHelper.cart,
    ),
    (
      AppImages.profileIc,
      'Profile',
      RouterHelper.profile,
    ),
  ];
  List<String> bottomNavIcs = [
    AppImages.homeIc,
    AppImages.heartIc,
    AppImages.cartIc,
    AppImages.profileIc,
  ];

  List<String> bottomNavTitles = ['Home', 'Favorite', 'Cart', 'Profile'];
  static HomeCubit get(context) => BlocProvider.of(context);
  List<ProductModel> bestSelling = [], newArrivals = [], recommendedForYou = [];
  Future<void> fetchData() async {
    bestSelling = await getBestSellingUseCase.perform();
    emit(BestSellingDataFetchedState());

    newArrivals = await getNewArrivalsUseCase.perform();
    emit(NewArrivalsDataFetchedState());

    recommendedForYou = await getRecommendedUseCase.perform();
    emit(RecommendedForYouDataFetchedState());
  }

  void changeCurrentSliderIndex(int index) {
    activeSliderIndex = index;
    emit(OfferIndexChangedState());
  }

  void changeCurrentBottomNavIndex(context, int index) {
    currentBottomNavIndex = index;
    AppNavigator.navigateToPopPush(context, bottomNavItems[index].$3);
    emit(BottomNavBarIndexChangedState());
  }
}
