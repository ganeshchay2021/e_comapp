// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final int currentSlider;
  final Function(int) onChanged;
  const BannerSlider({
    super.key,
    required this.currentSlider,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PageView(
              onPageChanged: onChanged,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              allowImplicitScrolling: true,
              children: [
                Image.asset(
                  "assets/slider.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/slider3.png",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/image1.png",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/slider.jpg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/slider3.png",
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 3),
                  height: 8,
                  width: currentSlider == index ? 15 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                    color: currentSlider == index
                        ? Colors.black
                        : Colors.transparent,
                  ),
                  duration: const Duration(microseconds: 1000),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
