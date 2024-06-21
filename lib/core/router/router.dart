import 'package:flutter/material.dart';
import 'package:slash_store/core/router/router_helper.dart';
import 'package:slash_store/features/cart/cart_screen.dart';
import 'package:slash_store/features/favorite/favorite_screen.dart';
import 'package:slash_store/features/home/presentation/home_screen/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/layout/app_layout.dart';
import 'package:slash_store/features/layout/cubit/app_cubit.dart';
import 'package:slash_store/features/profile/profile_screen.dart';
import 'package:slash_store/features/search/search_screen.dart';
import '../../features/home/presentation/home_screen/cubit/home_cubit.dart';

abstract class AppRouter {
  static final Map<String, WidgetBuilder> generateRoutes = {
    RouterHelper.layout: (context) => BlocProvider(
          create: (context) => AppCubit(),
          child: const AppLayout(),
        ),
    RouterHelper.home: (context) => BlocProvider(
          create: (context) => HomeCubit()..fetchData(),
          child: const HomeScreen(),
        ),
    RouterHelper.cart: (context) => const CartScreen(),
    RouterHelper.favorites: (context) => const FavoriteScreen(),
    RouterHelper.profile: (context) => const ProfileScreen(),
    RouterHelper.search: (context) => const SearchScreen(),
  };
}
