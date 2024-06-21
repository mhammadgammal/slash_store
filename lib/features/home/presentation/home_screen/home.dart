import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/home/presentation/home_screen/widgets/offers_widget.dart';
import 'cubit/home_cubit.dart';
import 'widgets/products_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return LayoutBuilder(builder: (context, constraintes) {
            return constraintes.maxWidth >= 550.0
                ? GridView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          1, // Adjust the number of columns as needed
                      childAspectRatio: constraintes.maxWidth >= 1235
                          ? 13 / 3
                          : constraintes.maxWidth >= 600.0
                              ? 10.0 / 3.0
                              : 20.0 /
                                  3.0, // Adjust the aspect ratio for the grid items
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 30.0, // Spacing between rows
                    ),
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
                  )
                : ListView(
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
                  );
          });
        },
      ),
    );
  }
}
