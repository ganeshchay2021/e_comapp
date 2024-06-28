import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_bloc.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_event.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_state.dart';
import 'package:e_comapp/pages/cart/widget/checkout_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CheckOutBox();
            },
          ));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: kprimaryColor, borderRadius: BorderRadius.circular(25)),
            child: const Text(
              "Checkout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: kcontentColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kcontentColor,
        title: const Text(
          "Favourite",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is ProductAddedState) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                final product = state.product[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kcontentColor,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(product.image),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 85,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  product.category,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(ProductRemoveEvent(product: product));
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              height: 40,
                              // width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    iconSize: 18,
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          ProductDecreaseEvent(index: index));
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    product.quantity.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  IconButton(
                                    iconSize: 18,
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          ProductIncreaseEvent(index: index));
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
