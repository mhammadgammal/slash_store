import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/home/presentation/home_screen/widgets/offers_widget.dart';
import 'cubit/home_cubit.dart';
import 'widgets/products_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/location_widget.dart';
import 'widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
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
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: 'Urbanist'),
                selectedLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                items: List.generate(
                  cubit.bottomNavTitles.length,
                  (index) => BottomNavigationBarItem(
                    icon: Image.asset(cubit.bottomNavIcs[index]),
                    label: cubit.bottomNavTitles[index],
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width /
                    cubit.bottomNavTitles.length *
                    cubit.currentBottomNavIndex,
                width: MediaQuery.of(context).size.width /
                    cubit.bottomNavTitles.length,
                
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
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SearchWidget(),
              OfferWidget(
                offers: cubit.offers,
                activeIndex: cubit.activeSliderIndex,
                changeCurrentIndex: cubit.changeCurrentSliderIndex,
              ),
              CategoryWidget(
                categories: cubit.categories,
              ),
              ProductsWidget(
                header: 'Best Selling',
                products: cubit.bestSelling,
              ),
              ProductsWidget(
                header: 'New Arrivals',
                products: cubit.newArrivals,
              ),
              ProductsWidget(
                header: 'Recommended For You',
                products: cubit.recommendedForYou,
              ),
            ],
          ),
        );
      },
    );
  }
}
