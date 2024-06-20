import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theme/app_color.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
    required this.offers,
    required this.activeIndex,
    required this.changeCurrentIndex,
  });
  final List<Image> offers;
  final void Function(int) changeCurrentIndex;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
            items: offers,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                changeCurrentIndex(index);
              },
            )),
      ),
      AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: offers.length,
          axisDirection: Axis.horizontal,
          effect: const WormEffect(
            activeDotColor: AppColor.complementaryColor,
            dotWidth: 20.0,
            dotHeight: 10.0,
          ))
    ]);
  }
}
