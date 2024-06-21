import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/cart/cart_screen.dart';
import 'package:slash_store/features/favorite/favorite_screen.dart';
import 'package:slash_store/features/home/presentation/home_screen/home.dart';
import 'package:slash_store/features/layout/cubit/app_cubit.dart';
import 'package:slash_store/features/home/presentation/home_screen/widgets/location_widget.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var cubit = AppCubit.get(context);
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
              Stack(alignment: Alignment.topRight, children: [
                Image.asset('assets/images/reminder.png'),
                const CircleAvatar(
                  radius: 5.0,
                  backgroundColor: Colors.red,
                )
              ]),
            ],
          ),
        ),
        bottomNavigationBar: Stack(
          children: [
            BottomNavigationBar(
              currentIndex: cubit.currentBottomNavIndex,
              onTap: cubit.changeCurrentBottomNavIndex,
              fixedColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              unselectedLabelStyle: const TextStyle(
                  color: Colors.black, fontSize: 15.0, fontFamily: 'Urbanist'),
              selectedLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
              items: List.generate(
                cubit.bottomNavItems.length,
                (index) => BottomNavigationBarItem(
                  icon: Image.asset(cubit.bottomNavItems[index].$1),
                  label: cubit.bottomNavItems[index].$2,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width /
                  cubit.bottomNavItems.length *
                  cubit.currentBottomNavIndex,
              width: MediaQuery.of(context).size.width /
                  cubit.bottomNavItems.length,
              child: Center(
                child: Container(
                  width: 100.0,
                  height: 8.0,
                  decoration: const BoxDecoration(
                    color: Colors.black, // Indicator color
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: cubit.bottomNavItems[cubit.currentBottomNavIndex].$3                            
      );
    });
  }
}
/*                   case 0:
                    return const HomeScreen();
                  case 1:
                    return const Center(child: Text('Search Screen'));
                  case 2:
                    return const Center(child: Text('Cart Screen'));
                  case 3:
                    return const Center(child: Text('Profile Screen'));
                  default:
                    return const HomeScreen(); */