import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/features/home/presentation/home_screen/widgets/offers_widget.dart';
import 'cubit/home_cubit.dart';
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
          body: Column(
            children: [
              const SearchWidget(),
              Expanded(
                child: OfferWidget(
                  offers: cubit.offers,
                  activeIndex: cubit.activeIndex,
                  changeCurrentIndex: cubit.changeCurrentIndex,
                ),
              ),


            ],
          ),
        );
      },
    );
  }
}
