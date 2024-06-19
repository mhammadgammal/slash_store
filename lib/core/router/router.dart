import 'package:flutter/material.dart';
import 'package:slash_store/core/router/router_helper.dart';
import 'package:slash_store/features/home/presentation/home_screen/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/home_screen/cubit/home_cubit.dart';

abstract class AppRouter {
  static final Map<String, WidgetBuilder> generateRoutes = {
    RouterHelper.home: (context) =>
        BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeScreen(),
        ),
  };
}