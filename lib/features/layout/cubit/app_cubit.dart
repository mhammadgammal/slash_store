import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/cart/cart_screen.dart';
import 'package:slash_store/features/favorite/favorite_screen.dart';
import 'package:slash_store/features/home/presentation/home_screen/home.dart';
import 'package:slash_store/features/profile/profile_screen.dart';
import '../../../core/theme/app_images.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;
  
  List<(String ic, String title, Widget)> bottomNavItems = [
    (
      AppImages.homeIc,
      'Home',
      const HomeScreen(),
    ),
    (
      AppImages.heartIc,
      'Favorite',
      const FavoriteScreen(),
    ),
    (
      AppImages.cartIc,
      'Cart',
      const CartScreen(),
    ),
    (
      AppImages.profileIc,
      'Profile',
      const ProfileScreen(),
    ),
  ];

  void changeCurrentBottomNavIndex(int index) {
    currentBottomNavIndex = index;

    emit(BottomNavBarIndexChangedState());
  }
}
