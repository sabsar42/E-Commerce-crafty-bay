import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ProductImageCarousel extends StatefulWidget {
  final double? height;

  const ProductImageCarousel({
    super.key,
    this.height,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              // autoPlay: true,
              viewportFraction: 1,
              height: widget.height ?? 220.0,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,

                    ),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,

          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: i == index
                                  ? AppColors.primaryColor
                                  : Colors.white70,
                              border: Border.all(
                                color: i == index
                                    ? AppColors.primaryColor
                                    : Colors.white70,
                              ),
                              borderRadius: BorderRadius.circular(30))),
                  ],
                );
              }),
        )
      ],
    );
  }
}
