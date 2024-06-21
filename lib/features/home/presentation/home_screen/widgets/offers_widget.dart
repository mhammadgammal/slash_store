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
    return LayoutBuilder(builder: (context, constraints) {
      print('width: ${constraints.maxWidth}');
      return Column(mainAxisSize: MainAxisSize.min, children: [
        CarouselSlider(
            items: offers,
            options: CarouselOptions(
              aspectRatio: constraints.maxWidth >= 600.0
                  ? 8.0
                  : constraints.maxWidth >= 450.0
                      ? 6.0
                      : 16.0 / 9.0,
              viewportFraction: constraints.maxWidth >= 450.0 ? 0.9 : 0.8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                changeCurrentIndex(index);
              },
            )),
        Visibility(
          visible: constraints.maxWidth >= 450.0,
          child: const SizedBox(
            height: 10.0,
          ),
        ),
        AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: offers.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
              activeDotColor: AppColor.complementaryColor,
              dotWidth: constraints.maxWidth >= 450.0? 40.0: 20.0,
              dotHeight: 10.0,
            ))
      ]);
    });
  }
}
