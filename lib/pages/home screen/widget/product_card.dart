// ignore_for_file: unrelated_type_equality_checks

import 'package:e_comapp/Model/product_model.dart';
import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/favourite%20bloc/favourite_bloc.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/ui/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  final ProductModel productModel;
  const ProductCard({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailsScreen(
              product: widget.productModel,
            );
          },
        ));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: widget.productModel.image,
                  child: Center(
                    child: Image.asset(
                      widget.productModel.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.productModel.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.productModel.price}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                              widget.productModel.colors.length, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: index == 0
                                      ? Colors.black38
                                      : Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: widget.productModel.colors[index],
                                      shape: BoxShape.circle),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              shape: BoxShape.circle),
                          child: Text(
                            "+${widget.productModel.colors.length}",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                context.read<FavouriteBloc>().add(
                      FavouriteLikeEvent(product: widget.productModel),
                    );
                setState(() {});
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: BlocBuilder<FavouriteBloc, FavouriteState>(
                  builder: (context, state) {
                    if (state is FavouriteLikeState) {
                      if (state.product.contains(widget.productModel)) {
                        return const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 20,
                        );
                      } else {
                        return const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                          size: 20,
                        );
                      }
                    } else {
                      return const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 20,
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
