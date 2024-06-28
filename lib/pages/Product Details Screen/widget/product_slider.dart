// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:e_comapp/Model/product_model.dart';

class ProductSlider extends StatelessWidget {
  final ProductModel product;
  final int currentSlider;
  final Function(int) onChanged;
  const ProductSlider({
    super.key,
    required this.product,
    required this.currentSlider,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: product.image,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            width: double.infinity,
            child: PageView(
              onPageChanged: onChanged,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              allowImplicitScrolling: true,
              children: [
                Image.asset(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
                Image.asset(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
                Image.asset(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
                Image.asset(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
                Image.asset(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
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
        )
      ],
    );
  }
}
