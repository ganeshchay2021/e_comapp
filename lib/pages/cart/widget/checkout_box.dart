import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_bloc.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_event.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/cart%20bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutBox extends StatefulWidget {
  const CheckOutBox({super.key});

  @override
  State<CheckOutBox> createState() => _CheckOutBoxState();
}

class _CheckOutBoxState extends State<CheckOutBox> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(TotalPriceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(),
        centerTitle: true,
        title: const Text("Payment Page"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          double totalPrice = 0.0;
          if (state is TotalPriceState) {
            totalPrice = state.totalPrice;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      filled: true,
                      fillColor: kcontentColor,
                      hintText: "Enter Discount Code",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      suffixIcon: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kprimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtotal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kprimaryColor,
                      minimumSize: const Size(double.infinity, 55),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
