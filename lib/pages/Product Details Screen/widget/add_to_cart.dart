// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_comapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_comapp/Model/product_model.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_bloc.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_event.dart';

class AddToCart extends StatelessWidget {
  final ProductModel product;
  const AddToCart({
    super.key,
    required this.product,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GestureDetector(
        onTap: () {
          context.read<CartBloc>().add(ProductAddToCartEvent(product: product));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: Color.fromARGB(255, 87, 85, 85),
              content: Text(
                "Successfully Added",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kprimaryColor,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: Text(
                "Add to Cart",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
