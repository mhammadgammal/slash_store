import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/core/router/navigator.dart';
import 'package:slash_store/core/router/router_helper.dart';
import 'package:slash_store/features/layout/cubit/app_cubit.dart';
import 'package:slash_store/features/home/presentation/home_screen/widgets/location_widget.dart';
import 'package:slash_store/features/layout/widgets/bottom_nav_bar_above_indicator.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var cubit = AppCubit.get(context);
      return LayoutBuilder(builder: (context, constraine) {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Slash.',
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const LocationWidget(),
                  GestureDetector(
                    onTap: () => AppNavigator.navigateToPush(
                        context, RouterHelper.reminder),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset('assets/images/reminder.png'),
                        const CircleAvatar(
                          radius: 5.0,
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: !kIsWeb
                ? BottomNavBarWithAboveIndicator(
                    currentBottomNavIndex: cubit.currentBottomNavIndex,
                    bottomNavItems: cubit.bottomNavItems,
                    changeCurrentBottomNavIndex:
                        cubit.changeCurrentBottomNavIndex,
                  )
                : null,
            body: cubit.bottomNavItems[cubit.currentBottomNavIndex].$3);
      });
    });
  }
}
