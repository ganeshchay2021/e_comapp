// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_comapp/pages/favourite/widget/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_comapp/constant/constant.dart';
import 'package:e_comapp/pages/Product%20Details%20Screen/bloc/favourite%20bloc/favourite_bloc.dart';

class FavouriteScreenBody extends StatefulWidget {
  const FavouriteScreenBody({super.key});

  @override
  State<FavouriteScreenBody> createState() => _FavouriteScreenBodyState();
}

class _FavouriteScreenBodyState extends State<FavouriteScreenBody> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLikeState) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                final product = state.product[index];
                return FavouriteCard(product: product);
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
