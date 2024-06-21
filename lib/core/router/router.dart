import 'package:flutter/material.dart';
import 'package:slash_store/core/router/router_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/layout/app_layout.dart';
import 'package:slash_store/features/layout/cubit/app_cubit.dart';

import '../../features/home/presentation/sub_screens/reminder_screen.dart';
import '../../features/home/presentation/sub_screens/see_all_categories_screen.dart';
import '../../features/home/presentation/sub_screens/see_all_products_screen.dart';

abstract class AppRouter {
  static final Map<String, WidgetBuilder> generateRoutes = {
    RouterHelper.layout: (context) => BlocProvider(
          create: (context) => AppCubit(),
          child: const AppLayout(),
        ),
    RouterHelper.reminder: (_) => ReminderScreen(),
    RouterHelper.seeAllCategories: (_) => SeeAllCategoriesScreen(),
    RouterHelper.seeAllProducts: (_) => SeeAllProductsScreen(),

  };
}
